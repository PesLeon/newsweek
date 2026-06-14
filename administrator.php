<?php
session_start();
include 'connect.php';
define('UPLPATH', 'img/');

$uspjesnaPrijava = false;
$admin           = false;
$imeKorisnika    = "";
$lozinkaKorisnika = "";  
$levelKorisnika   = 0; 

if (isset($_POST['prijava'])) {
    $prijavaImeKorisnika     = $_POST['username'];
    $prijavaLozinkaKorisnika = $_POST['lozinka'];

    $sql  = "SELECT korisnicko_ime, lozinka, razina FROM korisnik WHERE korisnicko_ime = ?";
    $stmt = mysqli_stmt_init($dbc);

    if (mysqli_stmt_prepare($stmt, $sql)) {
        mysqli_stmt_bind_param($stmt, 's', $prijavaImeKorisnika);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);
    }

    mysqli_stmt_bind_result($stmt, $imeKorisnika, $lozinkaKorisnika, $levelKorisnika);
    mysqli_stmt_fetch($stmt);

    if (mysqli_stmt_num_rows($stmt) > 0 && password_verify($prijavaLozinkaKorisnika, $lozinkaKorisnika)) {
        $uspjesnaPrijava = true;

        if ($levelKorisnika == 1) {
            $admin = true;
        } else {
            $admin = false;
        }

        $_SESSION['username'] = $imeKorisnika;
        $_SESSION['level']    = $levelKorisnika;

    } else {
        $uspjesnaPrijava = false;
    }
}

if (isset($_POST['delete'])) {
    $id    = $_POST['id'];
    $query = "DELETE FROM vijesti WHERE id=$id";
    mysqli_query($dbc, $query);
}

if (isset($_POST['update'])) {
    $id         = $_POST['id'];
    $naslov     = $_POST['naslov'];
    $sazetak    = $_POST['sazetak'];
    $tekst      = $_POST['tekst'];
    $kategorija = $_POST['kategorija'];
    $slika      = $_FILES['slika']['name'];

    if (isset($_POST['arhiva'])) {
        $arhiva = 1;
    } else {
        $arhiva = 0;
    }

    if ($slika != "") {
        $target_dir = 'img/' . $slika;
        move_uploaded_file($_FILES['slika']['tmp_name'], $target_dir);
        $sql  = "UPDATE vijesti SET naslov=?, sazetak=?, tekst=?, slika=?, kategorija=?, arhiva=? WHERE id=?";
        $stmt = mysqli_stmt_init($dbc);
        if (mysqli_stmt_prepare($stmt, $sql)) {
            mysqli_stmt_bind_param($stmt, 'sssssii', $naslov, $sazetak, $tekst, $slika, $kategorija, $arhiva, $id);
            mysqli_stmt_execute($stmt);
        }
    } else {
        $sql  = "UPDATE vijesti SET naslov=?, sazetak=?, tekst=?, kategorija=?, arhiva=? WHERE id=?";
        $stmt = mysqli_stmt_init($dbc);
        if (mysqli_stmt_prepare($stmt, $sql)) {
            mysqli_stmt_bind_param($stmt, 'ssssii', $naslov, $sazetak, $tekst, $kategorija, $arhiva, $id);
            mysqli_stmt_execute($stmt);
        }
    }
}
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Administracija - Newsweek</title>
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

        <?php if (($uspjesnaPrijava == true && $admin == true) || (isset($_SESSION['username']) && $_SESSION['level'] == 1)): ?>

            <h2>Administracija vijesti</h2>
            <a class="btn" href="unos.php">Dodaj novu vijest</a>
            <a class="btn btn_delete" href="odjava.php">Odjava</a>

            <?php
            $query  = "SELECT * FROM vijesti";
            $result = mysqli_query($dbc, $query);

            while ($row = mysqli_fetch_array($result)) {
                echo '
                <form enctype="multipart/form-data" action="" method="POST" style="border-top: 2px solid #f7ece8; margin-top: 24px; padding-top: 16px;">

                    <label>Naslov vijesti</label>
                    <input type="text" name="naslov" value="' . $row['naslov'] . '" required>

                    <label>Kratki sažetak vijesti</label>
                    <textarea name="sazetak" rows="4">' . $row['sazetak'] . '</textarea>

                    <label>Tekst vijesti</label>
                    <textarea name="tekst" rows="10">' . $row['tekst'] . '</textarea>

                    <label>Slika (ostavi prazno ako ne mijenjаš sliku)</label>
                    <input type="file" name="slika" accept="image/*">
                    <img src="' . UPLPATH . $row['slika'] . '" style="width:120px; margin-top:8px; display:block;">

                    <label>Kategorija vijesti</label>
                    <select name="kategorija">
                        <option value="U.S." '  . ($row['kategorija'] == 'U.S.'   ? 'selected' : '') . '>U.S.</option>
                        <option value="World" ' . ($row['kategorija'] == 'World'  ? 'selected' : '') . '>World</option>
                    </select>

                    <label>
                        <input type="checkbox" name="arhiva" ' . ($row['arhiva'] == 1 ? 'checked' : '') . '> Spremi u arhivu
                    </label>

                    <input type="hidden" name="id" value="' . $row['id'] . '">

                    <div>
                        <button class="btn" type="submit" name="update">Izmjeni</button>
                        <button class="btn btn_delete" type="submit" name="delete">Izbriši</button>
                    </div>

                </form>';
            }
            ?>

        <?php elseif ($uspjesnaPrijava == true && $admin == false): ?>

            <p class="poruka">Bok <?php echo $imeKorisnika; ?>! Uspješno ste prijavljeni, ali niste administrator.</p>
            <a class="btn btn_delete" href="odjava.php">Odjava</a>

        <?php elseif (isset($_SESSION['username']) && $_SESSION['level'] == 0): ?>

            <p class="poruka">Bok <?php echo $_SESSION['username']; ?>! Uspješno ste prijavljeni, ali niste administrator.</p>
            <a class="btn btn_delete" href="odjava.php">Odjava</a>

        <?php elseif ($uspjesnaPrijava == false && isset($_POST['prijava'])): ?>

            <p style="color:red;">Pogrešno korisničko ime ili lozinka. <a href="registracija.php">Registrirajte se ovdje.</a></p>

        <?php endif; ?>

        <?php if (!isset($_SESSION['username']) && !isset($_POST['prijava']) || ($uspjesnaPrijava == false && isset($_POST['prijava']))): ?>

            <h2>Prijava</h2>
            <form method="POST" action="">

                <label>Korisničko ime</label>
                <input type="text" name="username" required>

                <label>Lozinka</label>
                <input type="password" name="lozinka" required>

                <div>
                    <button class="btn" type="submit" name="prijava">Prijavi se</button>
                </div>

            </form>
            <p>Nemate račun? <a href="registracija.php">Registrirajte se</a></p>

        <?php endif; ?>

        </div>
    </main>

    <footer>
        <p>@<?php echo date("Y"); ?> Leon_Pesić lpesic@tvz.hr</p>
    </footer>
</body>
</html>