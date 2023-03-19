Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E03E4DC
	for <landlock@lists.linux.dev>; Sun, 19 Mar 2023 15:57:01 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id x3so37930459edb.10
        for <landlock@lists.linux.dev>; Sun, 19 Mar 2023 08:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679241419;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVMO+ybaIqW5BNQZNiYHYrEDPvQt/bk78axCyHKC7ag=;
        b=m7d4kc1htbgCQz1CMfvEL4PuRQ4mDwS0c55obaAX7/bPNpZJ1tfhkvpz8cjTVRyNod
         j1+wQLIDCiI2eZu7BJLUz9cxFTOp2H/f3NLfvKBK4UwK589G9b3OMES+EgMeCjtTAxcK
         EffHyYx4HwVrmz6PtNTDscis8o3kY+5IVsCTbznezERZrgCGoCPJRIc6pgnWy0bb0IUd
         GaF8X/wSGPO+03OPSMzTuYo+gvK3rsIimRHDEQzJyjpU95ocVhxW9ij60AtnYN21Tbg9
         REl7+ns4Z4ww7hefTSCN3Cl0SKgsImzORRG6XSkeEImKouej51cfTWEzk/PDauYsfwp5
         ul0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679241419;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVMO+ybaIqW5BNQZNiYHYrEDPvQt/bk78axCyHKC7ag=;
        b=taB7yreZN9FQumQ0VmUaEdvMDEJXRDVe4QDPnqguFfBCSOJoornojlIE7Zalgvvdv5
         gVSiVbNoLFlLJtKbZdd7/qO0+aFtMZIYtpJgWphIjm+wtvcFlR2IJXd+drZyhO5Hq0TA
         Cfeyg2TFI0mi0q50Kj72ZwbK5oIa9vZxEKLKIKORqpFMlcf6c0geR95JWpvtO09UItAQ
         UxQp3pFFBfLkEWNqOjjh9NtiYifaU8Xrr6wWu0jjXRRcTaZusZo5HPgWfOF64yq62Ikk
         nzxSfjpgKVKGxfyYYWtUpYiBtw7c7O6rSziM1r6zHV8eXajNOl7L7kEhkaf02bUIUD6d
         DrJg==
X-Gm-Message-State: AO0yUKWIoifVevSKTpsGj3a2BeioXYId+wfIGG2G0oW3aHD4Y0j/jlOf
	04BoGgfs2CBCzflqIARkne+QwC3lE4o=
X-Google-Smtp-Source: AK7set80GarpC86Ng9xZQpPv7OUcbrJxf1Nl7svmmGGGjznrVfM9qVgZtRO22/9fi42phhCm1gaFGA==
X-Received: by 2002:a17:906:d8d6:b0:886:ec6e:4c1 with SMTP id re22-20020a170906d8d600b00886ec6e04c1mr7573506ejb.59.1679241419613;
        Sun, 19 Mar 2023 08:56:59 -0700 (PDT)
Received: from localhost ([2a02:168:633b:1:7c09:9c3b:256e:8ba1])
        by smtp.gmail.com with ESMTPSA id le1-20020a170907170100b00930d505a567sm3359254ejc.128.2023.03.19.08.56.59
        for <landlock@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 08:56:59 -0700 (PDT)
Date: Sun, 19 Mar 2023 16:56:54 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: landlock@lists.linux.dev
Subject: Does Landlock not work with eCryptfs?
Message-ID: <20230319.2139b35f996f@gnoack.org>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello!

I have a machine where the home directory is encrypted with eCryptfs,
and it seems that Landlock is not working properly on eCryptfs files
(but the same program works as expected on other mounts)?


## Problem description

Steps to reproduce:

  * Create a directory "subdir" in the current directory
  * Enable Landlock but ask for "subdir" to be readable
  * os.ReadDir(dir)

Observed result:

* os.ReadDir function fails when trying to open the file (verified with strace)

Expected result:

* os.ReadDir should work, because we asked for it to work when enabling Landlock


## Reproduction code

I have uploaded a reproduction program in Go to Github,
which should be understandable also if you are primarily a C user:
https://github.com/gnoack/llecryptfsrepro/blob/main/repro.go

To build and run the reproduction code, run:

  git clone https://github.com/gnoack/llecryptfsrepro
  cd llecryptfsrepro
  go build
  ./llecryptfsrepro  # executes the three steps as above, check source code

You can invoke this binary in different file system types to see the difference.


I have admittedly only checked it with a distribution kernel on
Manjaro Linux: The Linux version is 6.2.2-1-MANJARO.

This looks like a bug to me?
Is this a known issue?

Thanks,
–Günther
