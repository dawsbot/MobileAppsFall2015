package com.example.dawsonbotsford.lab10;

import android.content.Intent;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.RadioGroup;

public class MainActivity extends AppCompatActivity {
    private CityName myCityName = new CityName();

    public void findCity(View view) {
        RadioGroup radio = (RadioGroup) findViewById(R.id.radioGroup);
        int radio_id = radio.getCheckedRadioButtonId();

        myCityName.setCityName(radio_id);

        String CityName = myCityName.getCityName();
        String CityURL = myCityName.getCityURL();

        Intent intent = new Intent(this, ReceiveCityActivity.class);

        intent.putExtra("cityName", CityName);
        intent.putExtra("cityURL", CityURL);

        startActivity(intent);

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
