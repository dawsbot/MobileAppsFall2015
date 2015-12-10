package com.example.dawsonbotsford.final_botsford;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void buildPizza(View v){
        String phrase;

        EditText pizza_Name_EditText = (EditText) findViewById(R.id.pizzaName);
        String pizzaName = pizza_Name_EditText.getText().toString();

        System.out.println(pizzaName);

        phrase = "Your pizza is called the " + pizzaName;

        TextView final_phrase_EditText = (TextView) findViewById(R.id.finalPhrase);
        final_phrase_EditText.setText(phrase);
    }
}
