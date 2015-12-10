package com.example.dawsonbotsford.final_botsford;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import org.w3c.dom.Text;

public class ReceiveShop extends AppCompatActivity {

    private String shopName;
    private String shopURL;

    private void updateText(){
        TextView shopName_TextView = (TextView) findViewById(R.id.shop_name);
        shopName_TextView.setText(shopName);

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive_shop);

        Intent intent = getIntent();

        shopName = intent.getStringExtra("pizzaShopName");
        shopURL = intent.getStringExtra("pizzaShopURL");

        updateText();
    }
    
    public void openInBrowser(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(shopURL));
        startActivity(intent);
    }
}
