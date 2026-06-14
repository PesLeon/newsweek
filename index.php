<?php
include 'connect.php';
define('UPLPATH', 'img/');
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Newsweek</title>
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
        <section class="clanak_naslov">
            <h2>U.S.</h2>
            <div class="clanak">
                <?php
                $query = "SELECT * FROM vijesti WHERE arhiva=0 AND kategorija='U.S.' LIMIT 3";
                $result = mysqli_query($dbc, $query);
                while ($row = mysqli_fetch_array($result)) {
                    echo '<article>';
                    echo '<a href="clanak.php?id=' . $row['id'] . '">';
                    echo '<img src="' . UPLPATH . $row['slika'] . '" alt="' . $row['naslov'] . '">';
                    echo '<h3>' . $row['naslov'] . '</h3>';
                    echo '</a>';
                    echo '</article>';
                }
                ?>
            </div>
        </section>

        <section class="clanak_naslov">
            <h2>World</h2>
            <div class="clanak">
                <?php
                $query = "SELECT * FROM vijesti WHERE arhiva=0 AND kategorija='World' LIMIT 3";
                $result = mysqli_query($dbc, $query);
                while ($row = mysqli_fetch_array($result)) {
                    echo '<article>';
                    echo '<a href="clanak.php?id=' . $row['id'] . '">';
                    echo '<img src="' . UPLPATH . $row['slika'] . '" alt="' . $row['naslov'] . '">';
                    echo '<h3>' . $row['naslov'] . '</h3>';
                    echo '</a>';
                    echo '</article>';
                }
                ?>
            </div>
        </section>
    </main>

    <footer>
        <p>@<?php echo date("Y"); ?> Leon_Pesić lpesic@tvz.hr</p>
    </footer>
</body>
</html>