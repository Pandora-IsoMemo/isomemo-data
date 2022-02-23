// Author: Sebastian Warnholz
// EMail: sebastian.warnholz@inwt-statistics.de
pipeline {
    options { disableConcurrentBuilds() }
    environment {
        CUR_PROJ = 'isomemo-data' // github repo name
        CUR_PKG_FOLDER = '.' // defaults to root
        TMP_SUFFIX = """${sh(returnStdout: true, script: 'echo `cat /dev/urandom | tr -dc \'a-z\' | fold -w 6 | head -n 1`')}"""
        GH_TOKEN = "has to be generated"
    }
    stages {
        stage('Testing') {
            steps {
                sh '''
                docker build -t tmp-$CUR_PROJ-$TMP_SUFFIX .
                docker run --rm --network host tmp-$CUR_PROJ-$TMP_SUFFIX check
                docker rmi tmp-$CUR_PROJ-$TMP_SUFFIX
                '''
            }
        }

        stage('Deploy R-package') {
            when { branch 'main' }
            steps {
                sh '''
                rm -vf *.tar.gz
                docker build -t tmp-$CUR_PROJ-$TMP_SUFFIX .
                docker run --rm --network host -v $PWD:/app --user `id -u`:`id -g` tmp-$CUR_PROJ-$TMP_SUFFIX R CMD build $CUR_PKG_FOLDER
                git clone https://$GH_TOKEN@github.com/Pandora-IsoMemo/drat.git
                docker run --rm -v $PWD:/app --user `id -u`:`id -g` tmp-$CUR_PROJ-$TMP_SUFFIX R -e "drat::insertPackage(dir(pattern='.tar.gz'), 'drat/docs'); drat::archivePackages(repopath = 'drat/docs')"
                cd drat && git add --all && git commit -m "Build from Jenkins" && git push
                cd ..
                rm -vf *.tar.gz
                rm -vfr drat
                docker rmi tmp-$CUR_PROJ-$TMP_SUFFIX
                '''
            }
        }
    }
}
