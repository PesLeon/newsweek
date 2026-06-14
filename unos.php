<?php
include 'connect.php';
define('UPLPATH', 'img/');

$poruka = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $naslov     = $_POST['naslov'];
    $sazetak    = $_POST['sazetak'];
    $tekst      = $_POST['tekst'];
    $kategorija = $_POST['kategorija'];
    $datum      = date('d.m.Y.');
    $slika      = $_FILES['slika']['name'];

    if (isset($_POST['arhiva'])) {
        $arhiva = 1;
    } else {
        $arhiva = 0;
    }

    if ($slika != "") {
        $target_dir = 'img/' . $slika;
        move_uploaded_file($_FILES['slika']['tmp_name'], $target_dir);
    }

    $sql  = "INSERT INTO vijesti (datum, naslov, sazetak, tekst, slika, kategorija, arhiva) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_stmt_init($dbc);

    if (mysqli_stmt_prepare($stmt, $sql)) {
        mysqli_stmt_bind_param($stmt, 'ssssssi', $datum, $naslov, $sazetak, $tekst, $slika, $kategorija, $arhiva);
        if (mysqli_stmt_execute($stmt)) {
            $poruka = "Vijest je uspješno dodana!";
        } else {
            $poruka = "Greška pri unosu.";
        }
    } else {
        $poruka = "Greška pri pripremi upita.";
    }

    mysqli_close($dbc);
}
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Unos vijesti - Newsweek</title>
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
        <div class="forma_div">
            <h2>Unos nove vijesti</h2>

            <?php if ($poruka): ?>
                <p class="poruka"><?php echo $poruka; ?></p>
            <?php endif; ?>

            <form enctype="multipart/form-data" method="POST" action="">

                <label>Naslov vijesti</label>
                <input type="text" name="naslov" required>

                <label>Kratki sažetak vijesti</label>
                <textarea name="sazetak" rows="4" required></textarea>

                <label>Tekst vijesti</label>
                <textarea name="tekst" rows="10" required></textarea>

                <label>Slika</label>
                <input type="file" name="slika" accept="image/*">

                <label>Kategorija vijesti</label>
                <select name="kategorija">
                    <option value="U.S.">U.S.</option>
                    <option value="World">World</option>
                </select>

                <label>
                    <input type="checkbox" name="arhiva"> Spremi u arhivu (ne prikazuj na stranici)
                </label>

                <div>
                    <button class="btn" type="submit">Dodaj vijest</button>
                    <button class="btn btn_delete" type="reset">Poništi</button>
                </div>

            </form>
        </div>
    </main>

    <footer>
        <p>@<?php echo date("Y"); ?> Leon_Pesić lpesic@tvz.hr</p>
    </footer>
</body>
</html>