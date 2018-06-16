package config;


import org.opentestsystem.rdw.ingest.processor.model.ConfigurableDataElement;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Set;

import static com.google.common.collect.Lists.newArrayList;

/**
 * Configuration for the required {@link ConfigurableDataElement}s.
 */
@Component
@ConfigurationProperties(prefix = "validation")
public class DataElementsConfiguration {

    private List<ConfigurableDataElement> requiredDataElements = newArrayList();

    public List<ConfigurableDataElement> getRequiredDataElements() {
        return requiredDataElements;
    }

    public Set<ConfigurableDataElement> getOptionalDataElements() {
        final Set<ConfigurableDataElement> optionalDataElements = ConfigurableDataElement.getAll();
        optionalDataElements.removeAll(requiredDataElements);
        return optionalDataElements;
    }
}