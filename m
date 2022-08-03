Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57AE1364
	for <landlock@lists.linux.dev>; Wed,  3 Aug 2022 13:30:04 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id q190so1643329vsb.7
        for <landlock@lists.linux.dev>; Wed, 03 Aug 2022 06:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stamus-networks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=gH5m8HTJz4zMYhL1pkGJreNK1kw6Oe5XO7V+Rr0MUNE=;
        b=w8xmlzcNbYnftTDFkK0RBuxv1TGz0F2BUct66Fim4UmQW0SswMrDmGUinUF9W+PoUj
         ukToSdor2lCoiOFLjvaJ//LFjALXvX3RrvK8as8mRXk5HgTkdleQOI+x+RoGTK3lTgIK
         MSwi7aTKUnNs+3UTPNe/jsGuyB5DzKI+AL+LnfDt22REmBt565niIEHlUFvKImZ1gHSJ
         myRxBLf3/gyGkUxtJwQM0kNXSWpxSjB4XKVbZ7GFfQ8bhGwWmj+CS7/y7tOE+kwlAVyv
         f2pd7nyEUZvsJqdUVQF2KzWSZH524QuqL1hoAKwxuwePtAo9tpYgWVjSKHbZqOC8Oylz
         7tPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=gH5m8HTJz4zMYhL1pkGJreNK1kw6Oe5XO7V+Rr0MUNE=;
        b=2p99iHZWFJW2jnQoEZKmGjThTAbRissH1GeKkCAY98/+YgKDiRL6O0f2j4ycZTYO4w
         x/pJ8zCEsB8Y3eKU1xyzjzlcBCxmxsA3cYunpVIIhr6N7Um74cM6HvlZwXyHbt34sFa/
         2hVOSUQWiXADhI8OFdP7TB4VAdc2fBRRDfRI1e1EDxLUfKQyFXbiVejajZz2hrQu9azf
         8EWSgYUYEAXTKkNO6r/SPjsHgXOdSLhnX+9pQsOGEhsALTdSo2lxp31xooHbWC/abkM6
         7gHUdcnD+N/Pt5IdBCM83GGz8pfejAlh6vTeENJX5IiK/Ud4N6Q/bkNYAvwvsCzY6YI4
         b4RQ==
X-Gm-Message-State: AJIora/gKrImmkWILkDDXDjTbzYsYCX6/cY4vTL+vyyXCTpdA7fgA6Wv
	Q4PgeF5GSmJwG+DtT1cBoQgwrNfurVrc4X0JXf5kaphCHiHUyQ==
X-Google-Smtp-Source: AGRyM1vggwkE/V5qSN2nWGiy3Nn1cf303Qw+LpxpiwbmCNv+Bno7+n/gOUaw4U9j7rO/5bkInF+ciDCXGFrbnXWl03E=
X-Received: by 2002:a67:af07:0:b0:358:3951:343e with SMTP id
 v7-20020a67af07000000b003583951343emr8997595vsl.6.1659533403150; Wed, 03 Aug
 2022 06:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Eric Leblond <el@stamus-networks.com>
Date: Wed, 3 Aug 2022 15:29:51 +0200
Message-ID: <CAGW2j+54_09ij9x2CUtYaWKz=k6ckHLY5un72=VVmeXuJxJoMQ@mail.gmail.com>
Subject: Adding landlock support to Suricata
To: landlock@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I worked on implementing support for landlock in Suricata. Suricata is
an open source network threat
detection engine that reads packets from the network or files and
outputs analysis in other files.
As such it is a good candidate for Landlock sandboxing.

The MR on Suricata is here and feedbacks and reviews are welcome:
https://github.com/OISF/suricata/pull/7688

With regards to the usage of Landlock API, it was overall really fine
and it did not took me long to obtain something working.
I did although struggle with a few things (yes I'm a newbie here):
- I looked at first if I had to add a library to the build system
before realizing that up to date headers were enough
- The examples and documentation I found don't cover multiple calls to
setup a policy and it got me confused a bit:
  - I had to test to verify that the logic is create ruleset/add
multiple rules/enforce ruleset
- I did struggle a bit on the ruleset scope flags (handled_access_fs)
as it was not clear to me this was a choice of the sandbox software
implementation

It is just small things that are easy to fix in documentation, for the
rest it was really easy to implement (if you know the software you are
adding support to).

Thanks a lot for Landlock, this is a great feature that is easy to implement.

Best regards,
-- 
Eric Leblond, CTO
Stamus Networks: https://www.stamus-networks.com/
