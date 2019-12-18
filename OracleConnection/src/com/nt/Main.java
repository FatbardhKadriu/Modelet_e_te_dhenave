package com.nt;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class Main extends Application {
	

	@Override
	public void start(Stage primaryStage)
	{
		GridPane pane = new GridPane();
		
		Button btnMadhesite = new Button("Kliko");
		Button btnTeDhenatH = new Button("Kliko");
		Button btnTeDhenatK = new Button("Kliko");
		Button btnCilesiaAjrit = new Button("Kliko");
		Label lbl = new Label("Klikoni per te pare tebelen e Madhesive me njesite perkatese");
		Label lbl2 = new Label("Klikoni per te pare te dhenat Klimatologjike");
		Label lbl3 = new Label("Klikoni per te pare te dhenat Hidrometrike");
		Label lbl4 = new Label("Klikoni per te pare te cilesine e ajrit");

		pane.setPadding(new Insets(50, 50, 50, 50));
		pane.addRow(0, lbl, btnMadhesite);
		pane.addRow(1, lbl2, btnTeDhenatK);
		pane.addRow(2, lbl3, btnTeDhenatH);
		pane.addRow(3, lbl4, btnCilesiaAjrit);
		pane.setHgap(100);
		pane.setVgap(50);
		Scene scene = new Scene(pane, 1000, 600);
	    scene.getStylesheets().addAll(this.getClass().getResource("style.css").toExternalForm());
	    pane.setStyle("-fx-background-image: url(images/bg1.jpg);-fx-background-size:cover;");
		primaryStage.setScene(scene);
		primaryStage.setTitle("Faqja Kryesore");
		primaryStage.show();
		NjesiteClass njesite = new NjesiteClass();
		ShfaqTeDhenatH shfaqH = new ShfaqTeDhenatH();
		ShfaqTeDhenatK shfaqK = new ShfaqTeDhenatK();
		ShfaqCilesineAjrit cilesiaAjrit = new ShfaqCilesineAjrit();
		btnMadhesite.setOnAction(e -> njesite.createStage());
		btnTeDhenatH.setOnAction(e -> shfaqH.createStage());
		btnTeDhenatK.setOnAction(e -> shfaqK.createStage());
		btnCilesiaAjrit.setOnAction(e -> cilesiaAjrit.createStage());

	}
	public static void main(String[] args) {
		Application.launch(args);

	}

}
