<?php
include 'connect.php';
define('UPLPATH', 'img/');

$id = $_GET['id'];
$query = "SELECT * FROM vijesti WHERE id=$id";
$result = mysqli_query($dbc, $query);
$row = mysqli_fetch_array($result);
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title><?php echo $row['naslov']; ?></title>
</head>
<body>
    <header>
        <div id="header_div">
            <p><?php echo date("D, M d, Y"); ?></p>
            <h1>Newsweek</h1>
        </div>
        <nav>
            <a href="index.php">Home</a>
            <a href="kategorija.php?kategorija=U.S.">U.S.</a>
            <a href="kategorija.php?kategorija=World">World</a>
            <a href="administrator.php">Administracija</a>
        </nav>
    </header>

    <main>
        <div class="vijest_div">
            <h2><?php echo $row['kategorija']; ?></h2>
            <h3><?php echo $row['naslov']; ?></h3>
            <p class="datum"><?php echo $row['datum']; ?></p>
            <img src="<?php echo UPLPATH . $row['slika']; ?>" alt="<?php echo $row['naslov']; ?>">
            <div class="tekst_vijesti">
                <p class="veliko_slovo"><?php echo mb_substr($row['tekst'], 0, 1); ?></p>
                <p><?php echo mb_substr($row['tekst'], 1); ?></p>
            </div>
        </div>
    </main>

    <footer>
        <p>@<?php echo date("Y"); ?> Leon_Pesić lpesic@tvz.hr</p>
    </footer>
</body>
</html>