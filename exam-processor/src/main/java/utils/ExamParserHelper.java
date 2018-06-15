package utils;

import org.opentestsystem.rdw.ingest.common.util.DataElementErrorCollector;
import org.opentestsystem.rdw.ingest.common.util.ParserHelper;
import org.opentestsystem.rdw.ingest.processor.model.DataElement;
import org.springframework.util.StringUtils;

import java.util.Set;
import java.util.function.Function;

/**
 * Exam's specific version of the {@link ParserHelper} that supports optional data elements
 */
public class ExamParserHelper extends ParserHelper {
    private final Set<DataElement> optionalDataElements;

    /**
     * Constructor
     *
     * @param elementErrorCollector an error collector to use for any errors
     * @param optionalDataElements  a set of optional {@link DataElement}s
     */
    public ExamParserHelper(final DataElementErrorCollector elementErrorCollector,
                            final Set<DataElement> optionalDataElements) {
        super(elementErrorCollector);
        this.optionalDataElements = optionalDataElements;
    }

    /**
     * A version of {@link ParserHelper#validate(String, Object, Function)} that allows for null or an empty value for optional data elements
     */
    public <T, R> R
    validate(final DataElement dataElement, final T rawValue, final Function<T, R> validateFx) {
        if ((rawValue == null || (rawValue instanceof String && !StringUtils.hasText((String) rawValue))) && optionalDataElements.contains(dataElement)) return null;

        return super.validate(dataElement.name(), rawValue, validateFx);
    }

    /**
     * Validation version of {@link ParserHelper#validate} that validates depending on a field being optional
     */
    public String validate(final DataElement dataElement, final String rawValue, final int maxLength) {
        return super.validate(dataElement.name(), rawValue, maxLength, !optionalDataElements.contains(dataElement));
    }
}