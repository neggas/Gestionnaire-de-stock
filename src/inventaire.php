<?php
error_reporting(E_ALL);
ini_set('display_errors', true);

session_start();
if (empty($_SESSION)) {
    header('Location: ./connexion.php');
}

include 'includes/config.php';


// get db product
$query = $pdo->prepare("SELECT * FROM inventory WHERE user_name=:user_name");
$query->bindValue('user_name', $_SESSION['pseudo']);
$query->execute();

$inventory = $query->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <h1>Inventaire des transaction</h1>
    <?php if (empty($inventory)) { ?>
        <h1>Votre inventaire est vide !</h1>
    <?php } else { ?>
        <div id="table-content">
            <table id="inventory-table" class="table-content-tb">
                <th>id</th>
                <th>Action</th>
                <th>Produit</th>
                <th>nombre</th>
                <th>date</th>

                <?php foreach ($inventory as $invt) { ?>
                    <tr>
                        <td><?= $invt->id; ?></td>
                        <td><?= $invt->actions; ?></td>
                        <td><?= $invt->product; ?></td>
                        <td><?= $invt->amount; ?></td>
                        <td><?= $invt->dates; ?></td>
                    </tr>

                <?php }; ?>
            </table>
        </div>
    <?php }; ?>


    <div class="home">
        <a href="./home.php">Retour</a>
    </div>
</body>

</html>