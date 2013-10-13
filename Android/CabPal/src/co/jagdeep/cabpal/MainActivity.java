package co.jagdeep.cabpal;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONException;

import com.google.android.gms.gcm.GoogleCloudMessaging;
import com.paypal.android.sdk.payments.PayPalPayment;
import com.paypal.android.sdk.payments.PayPalService;
import com.paypal.android.sdk.payments.PaymentActivity;
import com.paypal.android.sdk.payments.PaymentConfirmation;

import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Toast;

@TargetApi(Build.VERSION_CODES.GINGERBREAD)
public class MainActivity extends Activity {
	ImageButton imageButton;
	ImageButton imageButton2;
	Button button1;
	SharedPreferences sp;

	MainActivity obj;

	String SENDER_ID = "237275493492";

	public static final String EXTRA_MESSAGE = "message";
	public static final String PROPERTY_REG_ID = "registration_id";

	private static final String CONFIG_CLIENT_ID = "AfJXcRBHLgsIEJl81hYCaDMD9_7vW1Tuyc1VRRjrT9VENEdTEgru-qYZhMip";
	// when testing in sandbox, this is likely the -facilitator email address.
	private static final String CONFIG_RECEIVER_EMAIL = "kenorb-facilitator@googlemail.com";

	static final String TAG = "GCMDemo";

	GoogleCloudMessaging gcm;
	AtomicInteger msgId = new AtomicInteger();
	String regid;

	Context context;

	Boolean _paypalLibraryInit = false;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		context = getApplicationContext();
		obj = this;

		// if (checkPlayServices()) {
		addListenerOnButton();

		// gcm = GoogleCloudMessaging.getInstance(this);
		// regid = getRegistrationId(context);

		// if (regid.isEmpty()) {
		// //registerInBackground();
		// }

		// }
		sp = PreferenceManager.getDefaultSharedPreferences(this);
		
		Intent intent = new Intent(obj, PayPalService.class);

		// live: don't put any environment extra
		// sandbox: use PaymentActivity.ENVIRONMENT_SANDBOX
		intent.putExtra(PaymentActivity.EXTRA_PAYPAL_ENVIRONMENT,
				PaymentActivity.ENVIRONMENT_SANDBOX);

		intent.putExtra(PaymentActivity.EXTRA_CLIENT_ID, CONFIG_CLIENT_ID);

		startService(intent);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onMenuItemSelected(int featureId, MenuItem item) {
		switch (item.getItemId()) {
		case R.id.action_settings:
			Intent intent = new Intent(this, SettingsActivity.class);
			startActivity(intent);
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

	public void addListenerOnButton() {

		imageButton = (ImageButton) findViewById(R.id.imageButton1);
		
		button1 = (Button) findViewById(R.id.button1);

		imageButton.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View arg0) {

				new Thread() {
					public void run() {
						try {
							sendPost();
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}.start();

				imageButton.setImageResource(R.drawable.ic_launcher2);
				imageButton.setEnabled(false);
			}

		});

		// PayPal image button
		imageButton2 = (ImageButton) findViewById(R.id.imageButton2);

		imageButton2.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View arg0) {

				
				payButton();
				// imageButton2.setImageResource(R.drawable.ic_launcher2);

			}

		});
		
		button1.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View arg0) {

				imageButton2.setVisibility(View.INVISIBLE);

			}

		});

	}

	private final String USER_AGENT = "Mozilla/5.0";

	// HTTP GET request
	private void sendGet() throws Exception {

		String url = "http://www.google.com/search?q=mkyong";

		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// optional default is GET
		con.setRequestMethod("GET");

		// add request header
		con.setRequestProperty("User-Agent", USER_AGENT);

		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader(new InputStreamReader(
				con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		// print result
		System.out.println(response.toString());

	}

	// HTTP POST request
	private void sendPost() throws Exception {

		String url = "http://jagdeep.co:8080/CabPal-0.1/booking/save";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// add reuqest header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

		Date dt = new Date();
		String urlParameters = "sourceAddress="
				+ sp.getString("example_homeAddress", "test")
				+ "&destinationAddress="
				+ sp.getString("example_travelTo", "test") + "&clientName="
				+ sp.getString("example_text", "test")
				+ "&journeyTime=date.struct&journeyTime_day=" + dt.getDay()
				+ "&journeyTime_month=" + dt.getMonth() + "&journeyTime_year="
				+ dt.getYear() + "&createdTime=date.struct&createdTime_day="
				+ dt.getDay() + "&createdTime_month=" + dt.getMonth()
				+ "&createdTime_year=" + dt.getYear()
				+ "&_isConfirmed=&estimatedTime=0&cost=0&_isComplete=&phone="
				+ sp.getString("example_phone", "447804729132")
				+ "&company.id=1&create=Create";

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(urlParameters);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'POST' request to URL : " + url);
		System.out.println("Post parameters : " + urlParameters);
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader(new InputStreamReader(
				con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		// print result
		System.out.println(response.toString());

	}
	
	void payButton()
	{
		PayPalPayment payment = new PayPalPayment(new BigDecimal("10.00"), "GBP", "101 TAXIS");

	    Intent intent = new Intent(this, PaymentActivity.class);

	    // comment this line out for live or set to PaymentActivity.ENVIRONMENT_SANDBOX for sandbox
	    intent.putExtra(PaymentActivity.EXTRA_PAYPAL_ENVIRONMENT, PaymentActivity.ENVIRONMENT_SANDBOX);

	    // it's important to repeat the clientId here so that the SDK has it if Android restarts your
	    // app midway through the payment UI flow.
	    intent.putExtra(PaymentActivity.EXTRA_CLIENT_ID, "credential-from-developer.paypal.com");

	    // Provide a payerId that uniquely identifies a user within the scope of your system,
	    // such as an email address or user ID.
	    intent.putExtra(PaymentActivity.EXTRA_PAYER_ID, "jagdeep.nagpal@gmail.com>");

	    intent.putExtra(PaymentActivity.EXTRA_RECEIVER_EMAIL, CONFIG_RECEIVER_EMAIL);
	    intent.putExtra(PaymentActivity.EXTRA_PAYMENT, payment);

	    startActivityForResult(intent, 0);
	}
	
	@Override
	protected void onActivityResult (int requestCode, int resultCode, Intent data) {
	    if (resultCode == Activity.RESULT_OK) {
	        PaymentConfirmation confirm = data.getParcelableExtra(PaymentActivity.EXTRA_RESULT_CONFIRMATION);
	        if (confirm != null) {
	            try {
	                Log.i("paymentExample", confirm.toJSONObject().toString(4));

	                this.imageButton2.setVisibility(View.INVISIBLE);
	                // TODO: send 'confirm' to your server for verification.
	                // see https://developer.paypal.com/webapps/developer/docs/integration/mobile/verify-mobile-payment/
	                // for more details.

	            } catch (JSONException e) {
	                Log.e("paymentExample", "an extremely unlikely failure occurred: ", e);
	            }
	        }
	    }
	    else if (resultCode == Activity.RESULT_CANCELED) {
	        Log.i("paymentExample", "The user canceled.");
	    }
	    else if (resultCode == PaymentActivity.RESULT_PAYMENT_INVALID) {
	        Log.i("paymentExample", "An invalid payment was submitted. Please see the docs.");
	    }
	}
	
	@Override
	protected void onDestroy() {
	    stopService(new Intent(this, PayPalService.class));
	    super.onDestroy();
	}

}
