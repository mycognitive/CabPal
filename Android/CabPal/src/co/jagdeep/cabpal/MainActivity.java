package co.jagdeep.cabpal;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageButton;

// import co.jagdeep.paypal.PayPal;

public class MainActivity extends Activity {
	ImageButton imageButton;
	ImageButton imageButton2;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		addListenerOnButton();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onMenuItemSelected(int featureId, MenuItem item) {
		// TODO Auto-generated method stub
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

		imageButton.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View arg0) {

				imageButton.setImageResource(R.drawable.ic_launcher2); 

			}

		});
		
		// PayPal image button
		imageButton2 = (ImageButton) findViewById(R.id.imageButton2);

		imageButton2.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View arg0) {

				imageButton2.setImageResource(R.drawable.ic_launcher2); 

			}

		});


	}

}
