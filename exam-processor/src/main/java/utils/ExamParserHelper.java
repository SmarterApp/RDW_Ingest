package utils;

import com.google.common.collect.Iterables;
import org.opentestsystem.rdw.ingest.common.util.DataElementError;
import org.opentestsystem.rdw.ingest.common.util.DataElementErrorCollector;
import org.opentestsystem.rdw.ingest.common.util.ParserHelper;
import org.opentestsystem.rdw.ingest.processor.model.ConfigurableDataElement;
import org.springframework.util.StringUtils;

import java.util.Collection;
import java.util.Set;
import java.util.function.Function;

/**
 * Exam's specific version of the {@link ParserHelper} that supports optional data elements
 */
public class ExamParserHelper extends ParserHelper {
    private final Set<ConfigurableDataElement> optionalDataElements;

    /**
     * Constructor
     *
     * @param elementErrorCollector an error collector to use for any errors
     * @param optionalDataElements  a set of optional {@link ConfigurableDataElement}s
     */
    public ExamParserHelper(final DataElementErrorCollector elementErrorCollector,
                            final Set<ConfigurableDataElement> optionalDataElements) {
        super(elementErrorCollector);
        this.optionalDataElements = optionalDataElements;
    }

    /**
     * A version of {@link ParserHelper#validate(String, Object, Function)} that allows for null or an empty value for optional data elements
     */
    public <T, R> R
    validate(final ConfigurableDataElement dataElement, final T rawValue, final Function<T, R> validateFx) {
        if ((rawValue == null || (rawValue instanceof String && !StringUtils.hasText((String) rawValue))) && optionalDataElements.contains(dataElement)) return null;

        return super.validate(dataElement.name(), rawValue, validateFx);
    }

    /**
     * Validation version of {@link ParserHelper#validate} that validates depending on a field being optional
     */
    public String validate(final ConfigurableDataElement dataElement, final String rawValue, final int maxLength) {
        return super.validate(dataElement.name(), rawValue, maxLength, !optionalDataElements.contains(dataElement));
    }

    /**
     * Validates a given collection to be non null/empty depending if an element is required or not
     */
    public <T> Collection<T> isNotEmpty(final ConfigurableDataElement dataElement, final Collection<T> collection) {
        if (optionalDataElements.contains(dataElement)) return collection;

        if (Iterables.isEmpty(collection)) getElementErrorCollector().add(new DataElementError(dataElement.name(), "none", "must provide at least one value for " + dataElement.name()));
        return collection;
    }
}