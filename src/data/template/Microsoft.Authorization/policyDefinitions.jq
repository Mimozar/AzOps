del(.ResourceId, .id, .tenantId, .subscriptionId, .properties.policyType, .properties.metadata.createdOn, .properties.metadata.updatedOn, .properties.metadata.createdBy, .properties.metadata.updatedBy)
| walk(if type == "object" then with_entries(
      if .key == "equals" or .key == "notEquals" or .key == "like" or .key == "notLike" or .key == "match" or .key == "matchInsensitively" or .key == "notMatch" or .key == "notMatchInsensitively" or .key == "contains" or .key == "notContains" or .key == "in" or .key == "notIn" or .key == "containsKey" or .key == "notContainsKey" or .key == "less" or .key == "lessOrEquals" or .key == "greater" or .key == "greaterOrEquals" or .key == "exists"
      then .
      else select(.value != "" or (.key == "defaultValue" and .value == ""))
      end
    )
  else . end)