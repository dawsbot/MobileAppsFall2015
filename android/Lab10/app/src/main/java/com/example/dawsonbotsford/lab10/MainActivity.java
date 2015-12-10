package com.example.dawsonbotsford.lab10;

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

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
