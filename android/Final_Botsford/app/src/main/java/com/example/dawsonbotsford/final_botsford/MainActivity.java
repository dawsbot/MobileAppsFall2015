package com.example.dawsonbotsford.final_botsford;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    //Get's the name for this pizza from the edit text at top of app
    private String getPizzaName(){
        EditText pizza_Name_EditText = (EditText) findViewById(R.id.pizzaName);
        return pizza_Name_EditText.getText().toString();
    }

    //Get's the user's choice for gluten free or not from the slider
    private String getGlutenFree(){
        Switch gf_Switch = (Switch) findViewById(R.id.gluten_free);
        boolean choice = gf_Switch.isChecked();

        if (choice) {
            return "is a gluten free pizza";
        }
        else {
            return "is a gluent-free's ENEMY";
        }
    }

    public void buildPizza(View v){
        String phrase;

        phrase = "Your pizza is called the " + getPizzaName() + ". It " + getGlutenFree();

        TextView final_phrase_EditText = (TextView) findViewById(R.id.finalPhrase);
        final_phrase_EditText.setText(phrase);



    }
}
