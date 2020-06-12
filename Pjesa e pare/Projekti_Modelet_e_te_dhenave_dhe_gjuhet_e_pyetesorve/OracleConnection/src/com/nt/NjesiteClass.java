package com.nt;

import java.sql.*;
import java.util.List;

import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableRow;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class NjesiteClass{

	// Text fields
	private TextField madhesiaTxt = new TextField();
	private TextField njesiaTxt = new TextField();
	private Label lblMadhesia = new Label("Madhesia");
	private Label lblNjesia = new Label("Njesia");

	// Buttons
	private Button insertBtn = new Button("Insert");
	private Button updateBtn = new Button("Update");
	private Button deleteBtn = new Button("Delete");
	private Button clearBtn = new Button("Clear");

	// Table views
	private TableView madhesiteTable = new TableView();

	public void createStage() {
		Stage primaryStage = new Stage();

		lblMadhesia.setId("id1");
		lblMadhesia.setId("id2");
		// Form pane
		GridPane formPane = new GridPane();

		formPane.addRow(0, new Label("Madhesia: "), madhesiaTxt);
		formPane.addRow(1, new Label("Njesia: "), njesiaTxt);

		formPane.setHgap(10);
		formPane.setVgap(10);

		madhesiaTxt.setDisable(true);

		// Buttons pane
		HBox buttonsPane = new HBox(10);

		buttonsPane.getChildren().addAll(insertBtn, updateBtn, deleteBtn, clearBtn);

		insertBtn.setOnAction(e -> {
			insertMadhesi();
		});

		clearBtn.setOnAction(e -> {
			clearForm();
		});
		updateBtn.setOnAction(e -> {
			updateMadhesi();
		});
		deleteBtn.setOnAction(e -> {
			deleteMadhesi();
		});

		// Left Pane

		VBox leftPane = new VBox(15);

		leftPane.getChildren().addAll(formPane, buttonsPane);

		// Books table
		TableColumn<String, Njesite_Matese> column1 = new TableColumn<>("Madhesia");
		column1.setCellValueFactory(new PropertyValueFactory("madhesia"));
		column1.setPrefWidth(200);

		TableColumn<String, Njesite_Matese> column2 = new TableColumn<>("Njesia");
		column2.setCellValueFactory(new PropertyValueFactory("njesia"));
		column2.setPrefWidth(150);


		madhesiteTable.getColumns().add(column1);
		madhesiteTable.getColumns().add(column2);

		madhesiteTable.setRowFactory(tv -> {
			TableRow<Njesite_Matese> row = new TableRow<>();

			row.setOnMouseClicked(e -> {
				madhesiaTxt.setText(String.valueOf(row.getItem().getMadhesia()));
				njesiaTxt.setText(row.getItem().getNjesia());
				madhesiaTxt.setDisable(false);
			});

			return row;
		});
		madhesiteTable.setPrefWidth(360);
		madhesiteTable.setPrefHeight(200);

		// Main Pane
		HBox mainPane = new HBox(200);

		mainPane.getChildren().addAll(leftPane, madhesiteTable);

		mainPane.setPadding(new Insets(15, 15, 15, 15));
		
		mainPane.setStyle("-fx-background-image: url(images/bg2.jpg);-fx-background-size:cover;");

		Scene scene = new Scene(mainPane, 1000, 500);
	    scene.getStylesheets().addAll(this.getClass().getResource("style.css").toExternalForm());

		primaryStage.setTitle("Tabela per informimin e njesive matese");
		primaryStage.setScene(scene);
		primaryStage.setResizable(false);
		showMadhesi();

		primaryStage.show();
	}

	public static void main(String[] args) {
		Application.launch(args);
	}

	public void showMadhesi() {
		List<Njesite_Matese> madhesite = Njesite_Matese.getMadhesite();

		ObservableList<Njesite_Matese> madhesiteList = FXCollections.observableArrayList();

		for (int i = 0; i < madhesite.size(); i++) {
			madhesiteList.add(madhesite.get(i));
		}

		madhesiteTable.setItems(madhesiteList);
	}

	public void insertMadhesi() {

		if (Njesite_Matese.addMadhesi(madhesiaTxt.getText(), njesiaTxt.getText())) {
			showMadhesi();
			clearForm();
		}
	}

	private void deleteMadhesi() {
		if (Njesite_Matese.deleteMadhesi(madhesiaTxt.getText())) {
			showMadhesi();
			clearForm();
		}
	};

	private void updateMadhesi() {
		if (Njesite_Matese.updateMadhesi(madhesiaTxt.getText(), njesiaTxt.getText())) {
			showMadhesi();
			clearForm();
		}
	};

	public void clearForm() {
		madhesiaTxt.setText("");
		njesiaTxt.setText("");
	}

}