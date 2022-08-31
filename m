Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BD6361
	for <landlock@lists.linux.dev>; Wed, 31 Aug 2022 00:22:38 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id p5so14627871lfc.6
        for <landlock@lists.linux.dev>; Tue, 30 Aug 2022 17:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc;
        bh=oa+fNsvEKvuvjr1BDcsONwXTD6BUN2SCraZUD1KuJ1I=;
        b=lSzsj7TnKgEldqNqNs+RFQ6MrLyeo5GVuBqxeg6VdZNPTyFsbGtNrEO7OOiU+nsmFR
         jHLV99Y7sdXi9dLtl7ugSsqw4RAveJf4TJtMrcHmriDuHymF9bb/4ZaF4Mt1k63Dz7uW
         xWlc7SCpffedicGIAsetkAMAAOl3w4a4iFY+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc;
        bh=oa+fNsvEKvuvjr1BDcsONwXTD6BUN2SCraZUD1KuJ1I=;
        b=bRlLuXZLiRz/V4mm2be8t0KywxDv407G5YcpF/A6800jEKzhWUhvQoDHIwn4DZ/gW3
         XENXKKRRoDu4DdKSOQK5LfoAaYTsyY6vtkPJCAEsS5R+259H0mb8myEXNHffT8MT6Ab6
         Q4OSbkNsOV7GF8T1AwyS8Mk6vmpkP8J9ymsXbLsI0cz6xFP3Z5TzDD6eAVBUJffH37nP
         QNlMa6tIagqTRzGxcZ4JFRvQl7cUS/UH1QlT5Z+HxJNY2nuLIPB7B5n0a/eXS1vzY7PQ
         Feb+QSYAvgYhMYNc2k5CyAtgrokaac8yE99mUfnhF5DAxR0B2QOUGm/UcrWJ5tnHgVHc
         5UfQ==
X-Gm-Message-State: ACgBeo1vEJW9lL+Vv1dC5e8HdiPRNjv4A5fc+QYlCuGQ4pFNuU9UlxQW
	sLE98tNTnmlSP+bGY40JFaHsoHLNNmzT7xi8P6UCgBhj0P1kfA==
X-Google-Smtp-Source: AA6agR7SucSaPHAKZ5zOPa60VT8kYcJ4576iW5Rti/NVvO58K2zHwItWFOv8g4bv/8D7Lam1e0TGcdiBjL7fQHg9M6c=
X-Received: by 2002:a05:6512:3054:b0:48a:f489:1d68 with SMTP id
 b20-20020a056512305400b0048af4891d68mr7607042lfb.260.1661905356844; Tue, 30
 Aug 2022 17:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jeff Xu <jeffxu@chromium.org>
Date: Tue, 30 Aug 2022 17:22:26 -0700
Message-ID: <CABi2SkXXshnGiV7Tm3C-kvRn5+z26LPFdrmjT=GT39QmHSbHEw@mail.gmail.com>
Subject: current landlock limitations and what it means for sandboxer
To: landlock@lists.linux.dev, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Jorge Lucangeli Obes <jorgelo@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Micka=C3=ABl

I would like to dig into the limitation of landlock, to understand
more about the design approach of using landlock for sandboxing user
space applications.

To give a context, assume this sandboxer will implement 3 categories
of access using landlock: RO/RW/RX for the file system.

Limitation 1> It is currently not possible to restrict some file-related
actions accessible through these syscall families: chdir(2),
truncate(2), stat(2), flock(2), chmod(2), chown(2), setxattr(2),
utime(2), ioctl(2), fcntl(2), access(2). Future Landlock evolutions
will enable them to restrict them.

Question:
Does this mean: root or unprivileged users can use those APIs to break
out the normal  expectation of (RO/RX/RW) ?

For example:  we assign "RO" on fileA using landlock, can application
truncate(2) to shrink file size (thus change the content of file) ?

If that is the case, potentially, the sandboxer needs to consider
applying additional security mechanisms.

Or, if there is a plan to address those limitations in the short term,
then there is less to think about in sandboxer design.

Limitation 2> As for file renaming and linking, a sandboxed thread
cannot modify its filesystem topology, whether via mount(2) or
pivot_root(2). However, chroot(2) calls are not denied.

Question: Can chroot(2) be used to break out landlock policy then ?
.
Limitation 3> Access to regular files and directories can be
restricted by Landlock, according to the handled accesses of a
ruleset. However, files that do not come from a user-visible
filesystem (e.g. pipe, socket), but can still be accessed through
/proc/<pid>/fd/*, cannot currently be explicitly restricted.

Questions:
Is this a feature Gap compared with SELinux ?
Is there a plan to add the support for files under /proc ?
Is pipe/socket related to network access-control types in the roadmap ?

Limitation 4> Likewise, some special kernel file systems such as nsfs,
which can be accessed through /proc/<pid>/ns/*, cannot currently be
explicitly restricted. However, thanks to the ptrace restrictions,
access to such sensitive /proc files are automatically restricted
according to domain hierarchies. Future Landlock evolutions could
still explicitly restrict such paths with dedicated ruleset flags.

Question:
This seems to say /proc/<pid>/ns/* can be protected by having the
right value in YAMA config, right ?
And just for my curiosities:  Are there other file types under /proc/
that are not mentioned here (pipe/socket/ns), and need to be
considered during this sandboxer design ?

Question > This question is not about a limitation.
Landlock is designed for unprivileged user processes (this is great!)

How about using it for root (user with SYS_ADMIN cap),  Can root break
out of the Landlock policy in theory?


Thanks
Best Regards,
Jeff Xu
