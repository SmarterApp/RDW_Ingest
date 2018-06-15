package config;


import org.opentestsystem.rdw.ingest.processor.model.DataElement;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Set;

import static com.google.common.collect.Lists.newArrayList;

/**
 * Configuration for the required {@link DataElement}s.
 */
@Component
@ConfigurationProperties(prefix = "validation")
public class DataElementsConfiguration {

    private List<DataElement> requiredDataElements = newArrayList();

    public List<DataElement> getRequiredDataElements() {
        return requiredDataElements;
    }

    public Set<DataElement> getOptionalDataElements() {
        final Set<DataElement> optionalDataElements = DataElement.getAllConfigurable();
        optionalDataElements.removeAll(requiredDataElements);
        return optionalDataElements;
    }
}