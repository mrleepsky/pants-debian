import setuptools

setuptools.setup(
    name="pants-debian",
    version="0.0.1",

    author="Marcin Lipa",
    author_email="marcin.lipa@protonmail.com",

    description="Pants Debian package example",

    packages=setuptools.find_packages("src", exclude=("tests",)),
    package_dir={"": "src"},
    include_package_data=True,
    zip_safe=False,

    install_requires=[
        "requests",
    ],

    classifiers=[
        "Development Status :: 2 - Pre-Alpha",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3",
    ],
    entry_points={
        "console_scripts": [
            "pants-debian = pants_debian.main:main",
        ],
    }
)
