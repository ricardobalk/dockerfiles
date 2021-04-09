# scribus-headless

A while ago, I switched from Adobe InDesign to Scribus because I love open-source software and Scribus allows to automate things. So, what I did was automating the PDF generation.

I used Docker for it because I also love Docker. Docker allows Scribus to run without having to install it locally, and this 'headless' Scribus image can also be used for other documents. Cool. :sunglasses:

**1) Pull or build the headless Scribus image**

```bash
docker pull ricardobalk/scribus-headless
# or: docker build -t ricardobalk/scribus-headless .
```

**2) Run it, for example, generate a PDF out of SomeFile.sla:**

```bash
mkdir -p export/
docker run -it -v "$PWD/:/home/scribus/" ricardobalk/scribus-headless ./SomeFile.sla -g --python-script sla-to-pdf.py
```

> Important: The image on Docker Hub is just a bare Scribus image without scripts baked into the image. `sla-to-pdf.py` is available in [the repository on GitHub][GitHub Repository].

3) That's it. PDF file should be available in `export/`.

4) I've given you the knowledge. I've set you free. Now go play and make some awesome things with it.

---

If you like my Dockerfiles and/or other things I create/share, consider following me on [Twitter][] / [GitHub][] or [send me a coffee / beer / (...)][Ko-Fi] on Ko-Fi. You're awesome :+1:

[GitHub Repository]: https://github.com/ricardobalk/docker/tree/main/scribus-headless	"GitHub repository with Ricardo's Dockerfiles"
[Twitter]: https://twitter.com/ricardobalk	"Ricardo Balk on Twitter"
[GitHub]: https://github.com/ricardobalk	"Ricardo Balk on GitHub"
[Ko-Fi]: https://ko-fi.com/ricardobalk	"Ricardo Balk on Ko-Fi"