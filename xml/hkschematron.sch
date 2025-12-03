<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    
    <pattern>
        <rule context="character[@name='Dreamers']/entry">
            <let name="currentValue" value="./text()"/>
            <let name="precedingValues" value="preceding-sibling::entry/text()"/>
            <report test="$currentValue = $precedingValues">Duplicate entries found! <value-of select="$precedingValues[.=$currentValue]"/></report>
            
<!--            <assert test="not(entry[. = following-sibling::entry])">Duplicate entry found!</assert>-->
        </rule>
    </pattern>
</schema>