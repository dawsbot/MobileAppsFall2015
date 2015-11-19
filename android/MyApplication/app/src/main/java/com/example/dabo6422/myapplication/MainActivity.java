package com.example.dabo6422.myapplication;

import android.app.Activity;
import android.media.Image;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.ToggleButton;


public class MainActivity extends Activity {

    public void findPreference(View view) {
        EditText nameField = (EditText)findViewById(R.id.nameEditText);
        TextView output = (TextView) findViewById(R.id.final_output);
        Spinner climbTypeSpinner = (Spinner) findViewById(R.id.spinner);

        RadioGroup gyms = (RadioGroup) findViewById(R.id.radioGroupID);
        int gym_id = gyms.getCheckedRadioButtonId();
        String gymValue = "no gym";

        switch(gym_id){
            case R.id.gym1:
                gymValue = "the BRC";
                break;
            case R.id.gym2:
                gymValue = "the Spot";
                break;
            case R.id.gym3:
                gymValue = "Movement";
                break;

        }

        ToggleButton toggleButton = (ToggleButton) findViewById(R.id.toggleButton);
        boolean isScared = toggleButton.isChecked();

        String scared = "are";
        if (!isScared){
            scared += " not";
        }

        String nameValue = String.valueOf(nameField.getText());

        String climbTypeValue = String.valueOf(climbTypeSpinner.getSelectedItem());


        output.setText("Hello " + nameValue + ", I see you like to "  + climbTypeValue + " at " + gymValue + ".\n I see also that you " + scared + " scared of heights.");



    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ImageView myImage = (ImageView) findViewById(R.id.image);
        myImage.setImageResource(R.drawable.climb1);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
