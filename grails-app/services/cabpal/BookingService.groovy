package cabpal

import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.mapping.LinkGenerator
import java.util.HashMap
import java.util.Iterator
import java.util.List
import java.util.ArrayList
import java.util.Map

import com.twilio.sdk.TwilioRestClient
import com.twilio.sdk.TwilioRestException
import com.twilio.sdk.TwilioRestResponse
import com.twilio.sdk.resource.factory.CallFactory
import com.twilio.sdk.resource.factory.MessageFactory
import com.twilio.sdk.resource.instance.Account
import com.twilio.sdk.resource.instance.AvailablePhoneNumber
import com.twilio.sdk.resource.instance.Call
import com.twilio.sdk.resource.instance.Conference
import com.twilio.sdk.resource.instance.Participant
import com.twilio.sdk.resource.list.AccountList
import com.twilio.sdk.resource.list.AvailablePhoneNumberList
import com.twilio.sdk.resource.list.ParticipantList
import org.apache.http.NameValuePair
import org.apache.http.message.BasicNameValuePair
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

@Transactional
class BookingService {
    LinkGenerator grailsLinkGenerator
    /** The Constant ACCOUNT_SID. Find it at twilio.com/user/account */
    public static final String ACCOUNT_SID = "ACb9ddd21a0383212ec56b2d209d819275"

    /** The Constant AUTH_TOKEN. Find it at twilio.com/user/account */
    public static final String AUTH_TOKEN = "a263dd37812b0ce7259142e589af20a2"

    def clientBooking(Booking booking) {
        //Booking booking = new Booking(params).save(flush: true)
        //Trillio call comes here.
        callTaxiCompany(booking)
    }

    def callTaxiCompany(Booking booking)
    {

        // Create a rest client
        TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

        // Get the main account (The one we used to authenticate the client)
        Account mainAccount = client.getAccount();

        // Get all accounts including sub accounts
        AccountList accountList = client.getAccounts();

        // You can also get just the first page of data
        accountList = client.getAccounts();
        List<Account> accounts = accountList.getPageData();

        // Make a call
        CallFactory callFactory = mainAccount.getCallFactory();
        Map<String, String> callParams = new HashMap<String, String>();
        //taxi compnay number
        callParams.put("To", booking.company.phone); // Replace with a valid phone number
        //our application number
        callParams.put("From", "447530000012"); // Replace with a valid phone
        // number in your account
        //callParams.put("Url", "http://demo.twilio.com/welcome/voice/");
        //callParams.put("Url", "https://dl.dropboxusercontent.com/u/60881054/test.xml");

        WriteXMLFile temp = new WriteXMLFile(booking.sourceAddress, booking.destinationAddress, booking.phone, booking.clientName);
        temp.createXML();

        callParams.put("Url", "http://jagdeep.co:8080/CabPal-0.1/xml/requestCall.xml")
        println grailsLinkGenerator.serverBaseURL.substring(0,grailsLinkGenerator.serverBaseURL.lastIndexOf('/')) + grailsLinkGenerator.resource(dir: 'xml', file: 'requestCall.xml')
        Call call = callFactory.create(callParams);
    }


    def bookingResponse(long bookingId, boolean isConfirmed, int timeInMinutes, Currency cost){

        Booking booking = Booking.get(bookingId)
        booking.setIsConfirmed(isConfirmed)
        booking.setEstimatedTime(new Date(date.getTime() + timeInMinutes))


    }
}
//responses form the taxi company.

public class WriteXMLFile {
    private String fromLocation;// start journey
    private String toLocation;// end journey

    private String fromNumber;// customer telephone number
    private String toNumber;// taxi company to call

    //customer private details
    private String customerName;
    // price of journey

    private String say;// the voice text to be said to the taxi company

    public WriteXMLFile(String fromLocation, String toLocation,
                        String fromNumber, String customerName) {
        this.fromLocation = fromLocation;
        this.toLocation = toLocation;
        this.fromNumber = fromNumber;
        this.customerName = customerName;
        this.say = "Hello, This is an automated taxi booking service, " +
                //""
                " My client " + this.customerName + ", whose contact number is " + this.fromNumber +
                " would like to book a taxi as soon as possible! from " + this.fromLocation +
                " to " + this.toLocation
    }

    public void createXML() {
        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory
                    .newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

            // root elements
            Document doc = docBuilder.newDocument();
            Element rootElement = doc.createElement("Response");
            doc.appendChild(rootElement);

            Element say = doc.createElement("Say");
            say.appendChild(doc.createTextNode(this.say))
            say.setAttribute("voice","alice")
            rootElement.appendChild(say);

            TransformerFactory transformerFactory = TransformerFactory
                    .newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            File file = new File("webapps/CabPal-0.1/xml/requestCall.xml")
            println "path: " + file.absolutePath

            StreamResult result = new StreamResult(file);

            println result.toString()

            // Output to console for testing
            // StreamResult result = new StreamResult(System.out);

            transformer.transform(source, result);

            println "File saved!"

        } catch (ParserConfigurationException pce) {
            pce.printStackTrace();
        } catch (TransformerException tfe) {
            tfe.printStackTrace();
        }
    }
}
