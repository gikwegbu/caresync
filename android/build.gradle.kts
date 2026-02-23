allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    plugins.withId("com.android.library") {
        val androidExt = project.extensions.findByName("android")
        if (androidExt != null) {
            try {
                val namespaceProp = androidExt.javaClass.getMethod("getNamespace")
                val currentNamespace = namespaceProp.invoke(androidExt) as? String
                if (currentNamespace == null) {
                    val setNamespaceMethod = androidExt.javaClass.getMethod("setNamespace", String::class.java)
                    var groupStr = project.group.toString()
                    if (groupStr.isEmpty() || groupStr == "unspecified") {
                        groupStr = "com.example." + project.name.replace("-", "_")
                    }
                    setNamespaceMethod.invoke(androidExt, groupStr)
                }
            } catch (e: Exception) {
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
