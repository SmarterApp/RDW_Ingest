package scripts


import org.apache.tools.ant.util.ReaderInputStream
import org.jdom2.Document
import org.jdom2.Element
import org.jdom2.input.SAXBuilder
import org.jdom2.output.Format
import org.jdom2.output.LineSeparator
import org.jdom2.output.XMLOutputter
import org.jdom2.transform.JDOMResult
import org.jdom2.transform.JDOMSource
import org.jdom2.xpath.XPathFactory
import org.opentestsystem.rdw.ingest.script.PipelineScript
import org.xml.sax.InputSource

import javax.xml.transform.Transformer
import javax.xml.transform.TransformerFactory
import javax.xml.transform.stream.StreamSource

/**
 * Base class for Groovy pipeline scripts. Provides a DSL that will be available to the scripts.
 */
abstract class DSLScriptBase extends PipelineScript {

    /**
     * Adds XML parsing, transformation, formatting helper methods to the script class.
     *
     * See readme for specific examples of using these helper methods.
     *
     * @return reference to the script class (for chained calls).
     */
    @Override
    PipelineScript enableXmlExtensions() {
        def input = getProperty("input")

        if (input == null) {
            throw new RuntimeException(" XML Input cannot be null")
        }

        if (input instanceof String) {
            input = new StringReader(input)
        } else if (input instanceof byte[]) {
            input = new ByteArrayInputStream(input)
        } else if (!(input instanceof InputStream || input instanceof Reader)) {
            throw new RuntimeException("Unsupported input type: " + input.getClass())
        }

        Document document = new SAXBuilder().build(new InputSource(input))

        this.setProperty("document", document)

        // Unescapes up embedded HTML tags in embedded  in TRT values.
        String.metaClass.unescapeHtmlTags {
            delegate.replaceAll('&lt;','<').replaceAll('&gt;','>')
        }

        // Allows text content to be accessed as element.text and attributes values to be accessed as element.propName
        Element.metaClass.getProperty { property ->
            if (property == 'text') {
                delegate.coalesceText(true)
                delegate.getText()
            } else {
                delegate.getAttributeValue(property)
            }
        }

        // Allows text content to set by assignment to element.text and attributes by assignment to element.propName
        Element.metaClass.setProperty { property, value ->
            if (property == 'text') {
                delegate.setText(value)
            } else {
                delegate.setAttribute(property, value)
            }
        }

        // Helper method for modifying XML documents. Loops through elements matching given XPath expression and
        // applies the rule to each of them.
        this.metaClass.transform {xpath ->
            [by: {rule ->
                if (rule instanceof Closure) {
                    def elements = XPathFactory.instance().compile(xpath as String).evaluate(getProperty('document'))
                    elements.each { rule(it) }
                }
            }]
        }

        // Helper method for modifying XML documents. Filters the elements matching the provided rule. When modified
        // with "when", all elements matching the rule are removed from the document. When modified with "unless"
        // all the elements not matching the rule will be removed from the document.
        this.metaClass.delete {xpath ->
            [when: {rule ->
                if (rule instanceof Closure) {
                    def elements = XPathFactory.instance().compile(xpath as String).evaluate(getProperty('document'))
                    elements.each {
                        if(rule(it)) {
                            delete(it)
                        }
                    }
                }
            },
             unless: {rule ->
                 if (rule instanceof Closure) {
                     def elements = XPathFactory.instance().compile(xpath as String).evaluate(getProperty('document'))
                     elements.each {
                         if(!rule(it)) {
                             delete(it)
                         }
                     }
                 }
             }]
        }

        // Helper to delete a single element form a document with: delete element
        this.metaClass.delete {Element element ->
            if (element != null) {
                element.detach()
            }
        }

        // Converts the document object to a string. Typically this should be the last statement in a script.
        this.metaClass.getOutputXml {
            if (input instanceof Reader) {
                getOutputXmlAsString()
            } else {
                getOutputXmlAsByteArray()
            }
        }

        this.metaClass.getOutputXmlAsByteArray {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream()
            new XMLOutputter().with {
                format = Format.getRawFormat()
                format.setLineSeparator(LineSeparator.NONE)
                output(getProperty('document'), outputStream)
            }

            return outputStream.toByteArray()
        }

        this.metaClass.getOutputXmlAsString {
            StringWriter stringWriter = new StringWriter()

            new XMLOutputter().with {
                format = Format.getRawFormat()
                format.setLineSeparator(LineSeparator.NONE)
                output(getProperty('document'), stringWriter)
            }

            return stringWriter.toString()
        }

        // Apply as XSL transformation to the document by: apply xsl
        // where xsl is a String containing the XSL document, a file represented by a java.io.File object,
        // or an open java.io.InputStream.
        this.metaClass.applyXsl {xsl ->
            if (xsl instanceof String) {
                xsl = new ReaderInputStream(new StringReader(xsl))
            }

            JDOMSource source = new JDOMSource((Document)getProperty('document'))
            Transformer transformer = TransformerFactory.newInstance().newTransformer(new StreamSource(xsl))
            JDOMResult out = new JDOMResult()
            transformer.transform(source, out)

            setProperty('document', out.document)
        }

        return this
    }
}
