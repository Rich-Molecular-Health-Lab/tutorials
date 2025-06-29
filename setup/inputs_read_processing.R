subjects <- list(
  marmoset = list(
    HAM  = "Hamlet",
    HER  = "Hera",
    JAR  = "JarJar BINKS",
    OPH  = "Ophelia",
    KUB  = "Kubo",
    KOR  = "Korra",
    WOL  = "Wolverine",
    IRI  = "Iris",
    GOO  = "Goose",
    LAM  = "Lambchop",
    FRA  = "Franc",
    IVY  = "Ivy",
    CHA  = "Charles",
    PAD  = "Padme",
    BUB  = "Bubblegum",
    GRO  = "Grogu",
    MAR  = "Marshmallow",
    BUD  = "Buddy",
    JOA  = "Joans",
    HEN  = "Henry",
    GIN  = "Ginger"
  ),
  loris = list(
    WARB = "Warble",
    CULI = "Culi"
  ),
  bats = list(
    UNKN = "Unknown",
    EPFU = "EPFU",
    MYLE = "MYLE",
    LABO = "LABO",
    MYCI = "MYCI",
    LANO = "LANO",
    NYHU = "NYHU"
  ),
  envir = list(
    UNK = "Unknown"
  ),
  isolates = list(
    UNK = "Unknown"
  )
)


seqruns <- list(
  loris     = as.list(c(paste0("hdz", 1:19))),
  marmoset  = as.list(sprintf("cm%03d", 1:10)),
  isolates  = as.list(paste0("salci", 1)),
  bats      = as.list(paste0("nwr", 1))
)

