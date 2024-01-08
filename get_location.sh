#!/bin/bash
# Shebang line specifying the interpreter to be used for the script, in this case, Bash.

if [ "$1" == "" ]
then
    # Check if the first command-line argument (IP address) is empty.
    echo "Usage: $0 IP"
    # Print a usage message indicating how to use the script with correct syntax.
    exit 1
    # Exit the script with a status code of 1 (indicating an error) if the condition is true.
fi

res=$(curl "http://ip-api.com/json/$1" -s)
# Use cURL to fetch JSON data about the provided IP address from ip-api.com and store the result in the 'res' variable.

status=$(echo "$res" | jq '.status' -r)
# Extract the 'status' field from the JSON response using jq and store it in the 'status' variable.

if [ "$status" == "success" ]
then
    # Check if the 'status' is "success," indicating that the IP information was retrieved successfully.

    city=$(echo "$res" | jq '.city' -r)
    # Extract and store the 'city' field from the JSON response.

    echo "CITY: $city"
    # Print the city information.

    region=$(echo "$res" | jq '.regionName' -r)
    # Extract and store the 'regionName' field from the JSON response.

    echo "REGION: $region"
    # Print the region information.

    country=$(echo "$res" | jq '.country' -r)
    # Extract and store the 'country' field from the JSON response.

    echo "COUNTRY: $country"
    # Print the country information.

    countryCode=$(echo "$res" | jq '.countryCode' -r)
    # Extract and store the 'countryCode' field from the JSON response.

    echo "COUNTRYCODE: $countryCode"
    # Print the country code information.

    zip=$(echo "$res" | jq '.zip' -r)
    # Extract and store the 'zip' field from the JSON response.

    echo "ZIP: $zip"
    # Print the ZIP code information.

    timezone=$(echo "$res" | jq '.timezone' -r)
    # Extract and store the 'timezone' field from the JSON response.

    echo "TIMEZONE: $timezone"
    # Print the timezone information.

    lat=$(echo "$res" | jq '.lat' -r)
    # Extract and store the 'lat' field from the JSON response.

    echo "LAT: $lat"
    # Print the latitude information.

    lon=$(echo "$res" | jq '.lon' -r)
    # Extract and store the 'lon' field from the JSON response.

    echo "LON: $lon"
    # Print the longitude information.

    org=$(echo "$res" | jq '.org' -r)
    # Extract and store the 'org' field from the JSON response.

    echo "ORG: $org"
    # Print the organization information.

    isp=$(echo "$res" | jq '.isp' -r)
    # Extract and store the 'isp' field from the JSON response.

    echo "ISP: $isp"
    # Print the ISP (Internet Service Provider) information.

    query=$(echo "$res" | jq '.query' -r)
    # Extract and store the 'query' field from the JSON response.

    echo "QUERY: $query"
    # Print the queried IP address.

else
    # If the 'status' is not "success," print a failure message.
    echo "Failed to get location information for IP: $1"
fi
