<?php

extract($_POST);
$error_message = array();
$sucess_message = array();

if (isset($vendre)) {

    $product = htmlspecialchars($product);
    $quantity = htmlspecialchars($quantity);

    #condition sur la quantité du produit a vendre

    $req_quantity = $pdo->prepare("SELECT amount FROM product WHERE name=:product");
    $req_quantity->bindValue('product', $product);
    $req_quantity->execute();
    $req_quantity = $req_quantity->fetch();

    $req_quantity = (int)$req_quantity->amount;

    if (!empty($quantity)) {

        if ($quantity <= 0 || $quantity > $req_quantity) {
            $error_message['exces'] = "Veuiller verifier la quantité à vendre";
        }
    } else {
        $error_message['null'] = "Diffinisser le nombre de produit a vendre svp";
    }

    if (empty($error_message)) {

        $new_amnt = $req_quantity - $quantity;
        $sucess_message['vendus'] = "Le produit a été vendus avec succes";

        #mise a jour du nombre d'article restant;
        $req = $pdo->prepare('UPDATE product SET amount =:new_amnt  WHERE name =:product');
        $req->execute(array(
            'new_amnt' => $new_amnt,
            'product' => $product,
        ));

        echo $new_amnt;
        #enregistrement de la vente dans la table inventory
        $action = "vente";
        $produit = $product;
        $amount = $quantity;

        date_default_timezone_set('Africa/Abidjan');

        $prepare = $pdo->prepare('INSERT INTO inventory(actions, product, amount, dates,user_name) 
		    	VALUES(?, ?, ?, NOW(),?)');
        $prepare->execute(array($action, $produit, $amount, $_SESSION['pseudo']));




        header("Location: ./inventaire.php");
    }
}
