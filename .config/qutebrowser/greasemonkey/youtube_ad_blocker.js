setInterval(() => {
    const btn = document.querySelector('.videoAdUiSkipButton,.ytp-ad-skip-button')
    if (btn) {
        btn.click()
    }
    const ad = [...document.querySelectorAll('.ad-showing')][0];
    if (ad) {
        document.querySelector('video').playbackRate = 16;
    }
}, 1)
