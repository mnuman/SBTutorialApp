xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace cus="http://xmlns.xyzbank.com/schema/Customer";
(:: import schema at "../WSDLs/CustomerPS.wsdl" ::)
declare namespace addr="urn:xyzbank:cust:schema:address";
(:: import schema at "../../XYZCommon/WSDLs/AddrValidationService.wsdl" ::)

declare variable $inputAddr as element() (:: schema-element(cus:Customer) ::) external;

declare function local:AddrToAddrBSInput($inputAddr as element() (:: schema-element(cus:Customer) ::)) as element() (:: schema-element(addr:addrval_input) ::) {
    <addr:addrval_input>
        <address_line>{fn:concat($inputAddr/Address1, ",", data($inputAddr/Address2), ",",fn:data($inputAddr/Address3))}</address_line>
        <state>{fn:data($inputAddr/State)}</state>
        <country>{fn:data($inputAddr/Country)}</country>
        <zip_code>{fn:data($inputAddr/ZipCode)}</zip_code>
    </addr:addrval_input>
};

local:AddrToAddrBSInput($inputAddr)
