<?php

session_start();
if (empty($_SESSION['pseudo'])) {
    header('Location: ./connexion.php');
}

include 'includes/config.php';
include 'includes/vente.php';

// get db product
$query = $pdo->prepare("SELECT * FROM product WHERE user_name=:user_name");
$query->bindValue('user_name', $_SESSION['pseudo']);
$query->execute();

$product_infos = $query->fetchAll();

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vente de produit</title>
</head>

<body>
    <h1>Vente de produit</h1>

    <div id="sell-content">
        <div class="error_messages">
            <?php if (!empty($error_message['null'])) {
                echo $error_message['null'];
            } ?>
        </div>
        <div class="error_messages">
            <?php if (!empty($error_message['exces'])) {
                echo $error_message['exces'];
            } ?>
        </div>
        <div class="succes_messages">
            <?php if (!empty($sucess_message['vendus'])) {
                echo $sucess_message['vendus'];
            } ?>
        </div>
        <form method="POST" action="">
            <div class="form-item">
                <div class="form-item-id">
                    <label for="choice">Choix du produits</label>
                </div>
                <div id="product">
                    <select name="product">
                        <?php foreach ($product_infos as $products) { ?>
                            <option value="<?= $products->name ?>" id="choice"> <?= $products->name ?> </option>
                        <?php } ?>
                    </select>
                </div>

            </div>

            <div class="form-item">
                <div class="form-item-id">
                    <div class="form-item-id">
                        <label for="quantity">Choix de la quantité</label>
                    </div>
                    <div id="quantity-box">
                        <input type="number" id="quantity" name="quantity">
                    </div>
                </div>
            </div>

            <div class="submit-box">
                <input type="submit" value="Vendre" name="vendre">
            </div>
        </form>
    </div>

</body>

</html>