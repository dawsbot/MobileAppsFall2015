package com.example.dawsonbotsford.lab10;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class ReceiveCityActivity extends AppCompatActivity {
    private String cityName;
    private String cityURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive_city);

        Intent intent = getIntent();

        cityName = intent.getStringExtra("cityName");
        cityURL = intent.getStringExtra("cityURL");

        TextView messageView = (TextView) findViewById(R.id.city_name);
        System.out.println (cityName);
        System.out.println (cityURL);
        messageView.setText(cityName);



    }
}
