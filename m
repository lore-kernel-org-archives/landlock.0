Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE934B402
	for <landlock@lists.linux.dev>; Fri, 21 Nov 2025 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738106; cv=none; b=WVyixOfJ1EGbeeDAmL5aBUrfelXsbsuXjXyWO1gf5ZCWo2t16eJtJfHn+rNwS0USYV1VGDGUXYYsdgtH41+yhILdLLwEOhdZI5iysL2n8qVdoxRNYRbOOQ2pIY78H0pqiIvS8o1lJPYaT/GL8B2gldbQV9CyfbZm5TdtDQkmxqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738106; c=relaxed/simple;
	bh=2zZVzebAXvlaD/nLS5204poRIu+u/h9zMJMEg2qO/JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=X22IRdEbON2C+YAJF3y17iW5sRS7fuQoGnJtb7L9asUbNuaKJ77U7cQc0SAy/JgkLrMzTBrueJ6Q532LcqE3ILf6EmI1du0DjJPGdnCEPHAv8tpOiPIxnJkTfYbv3dVweL2G0l7w8djEZHByJiloquHMzFN4RtA7v8A+zJxWJyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxMdyBLP; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxMdyBLP"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59583505988so3016448e87.1
        for <landlock@lists.linux.dev>; Fri, 21 Nov 2025 07:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763738101; x=1764342901; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rK1mgsgEEMbtHryAMWmlKGLZdvVAc2fZLiW+thYyATo=;
        b=jxMdyBLPSzWUnzDApMmTwkcBW8puZRBIUy+LIpDJ2UINvscmQXgmnEscuEGv99eztT
         NLfOxx9Ol5I6lHaVzaiPUoxV3mpKzFsqSb+7vUm2mGJy07QcPxYtbDnvzeCsDgcN9vYr
         ma3xD5JD5BMCfF9b1FpzySkjFzKp5UovqujcFlaIVEiq+4Dvd74m5Kt+2yKIaaZnhHVh
         8GYQpJ/xWwo9q6h+Rx89MTqpnYDcSAF35zqga6a1+EDQRJmz+/XRYeA5xSvAaritZk+Z
         LPoS/sE+fT2fDKtpzMDltaxN76FKmQAqqDdXSl8fXBzIS8SROYisH+O3A4Oy/JjVIvfG
         01MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763738101; x=1764342901;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rK1mgsgEEMbtHryAMWmlKGLZdvVAc2fZLiW+thYyATo=;
        b=uYiawFDCvmYSkKs7OT84+yhvZAG+ElpnhyFHzdv0inrfT5qFxfrEctJ6pJ/NWmhvaz
         rWROwZ0eopkjcjQZ9udtOeBGrg9SETtOx0rAK65w2kp0NWAO4CIXkAj4swsOwmiWOdR0
         +cD+/6ZGcWopOhsYcm20Yop32OLZJ6wd/mtzi6OAKVIrPawCaGan8J/nrXxRvR3sSgJ2
         c6bV8KbUGryV7px2G5w3jy10S/RKH9SGIoQIZ35gM4e0hfNZwx1SMEEbi/Wkwe26J3T+
         wy12qsaOOmIIAvNSDrH7K2CzL3tNgC7dfwFv3is9DtcAyueOAqWzfGJuIARsgppaLURm
         6YMw==
X-Gm-Message-State: AOJu0Yz3nJNcBPmP2BaIyukL/olbIeXNgOIHRnzvxt2xyLfhVXIDqrQ7
	JMcrKlPTIMguuObgGYB209u0yqnh5dc2VKfwdkOBcqCLmbq6ozbReKUY7SsX/iYyXp42NZOFZxu
	cuTe3BbXg0pKcQGmAJKhiZyG1CNRWtX5TLaWB
X-Gm-Gg: ASbGncsRJJakf3rWEcjLE6NbUbeDaqD1S7kAM+HWjznShw6lXYDt+tFw4s1Bjp2amzp
	jnguKfy6XtM632xlfj9+z+L2/DYoTHun3gfnZHnoojrcnsA6juP1CI6Xj5yQIqwGlc84+FbTCPj
	TRLeUUrXp8+07QftfXLH1py8TBW6A32IA9njs5ljV05zvCe9D8bcIrDWXzg6fkEneTk1wG6S2GF
	TaJ0peWZ9O4jpYfgMU8NOyDIwDs/jPCLoNcV3UA9mRqJCooWLsx1Z/+e15DqzSvbFMWsg==
X-Google-Smtp-Source: AGHT+IFEyK4iW2Qg2fZcMV7VKXEbplxs9smbW7N4RQd+V0amh6DAAGVPT+uv74Pca8qh+H1R9Mdn9XiR0wiku/tBYYg=
X-Received: by 2002:a05:6512:2207:b0:594:2b8e:d6bf with SMTP id
 2adb3069b0e04-596a377e577mr916204e87.12.1763738101058; Fri, 21 Nov 2025
 07:15:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119211937.52cd76a3@ciel> <20251120.aeC5eePhof6e@digikod.net>
 <20251120203745.32463645@ciel> <20251121.eeM6eighaose@digikod.net>
In-Reply-To: <20251121.eeM6eighaose@digikod.net>
Reply-To: noloader@gmail.com
From: Jeffrey Walton <noloader@gmail.com>
Date: Fri, 21 Nov 2025 10:14:23 -0500
X-Gm-Features: AWmQ_bnnfU9oz2buCAyg3hl6tF_zvggZyVFVzVkR6lOL5DqYQISOEhg71BuFoQY
Message-ID: <CAH8yC8k=2ZJ5-Y+L8mxH65D8nLtuDvLRfWvy0OjWVsPM7Wx=_w@mail.gmail.com>
Subject: Re: Question about using Landlock
To: landlock@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 9:44=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@digik=
od.net> wrote:
>
> On Thu, Nov 20, 2025 at 08:37:45PM +0000, Marek K=C3=BCthe wrote:
> > On Thu, 20 Nov 2025 18:36:50 +0100
> > Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> wrote:
> >
> > > On Wed, Nov 19, 2025 at 09:19:37PM +0000, Marek K=C3=BCthe wrote:
> >
> > Thanks for your answers! That answered many of my questions.
> >
> > > > When accessing the file system, I'm supposed to specify the fd of t=
he
> > > > file, but then I already have that file open. And that's exactly wh=
at
> > > > Lockland is supposed to control.
> > >
> > > The goal of a file descriptor is to identify a file or another kernel
> > > resource, without race condition, and in an absolute way.  It doesn't
> > > mean it gives access to the underlying resource (but that's the case
> > > most of the time).  With Landlock, it is encouraged to open files wit=
h
> > > O_PATH (see the sandboxer.c example) to avoid leaking opened
> > > files/access.
> > >
> > > Using file paths for kernel interfaces should be avoided.
> >
> > Could you give an example? I think you mean fd's that don't refer to
> > anything in the file system?
>
> I mean that dealing with file paths is racy, it's much better to open a
> file once and then perform operations on the related file descriptor
> instead of on the same path.  For instance, you can do a lot of things
> with syscalls ending with "at" (e.g. openat2 + AT_EMPTY_PATH, ioctl,
> read).

For the OP.... A second benefit of the various *at() functions is a
per-thread working directory in a multithreaded app.  Also see the
Notes section in the openat(2) man page;
<https://linux.die.net/man/2/openat>.

> > > Creating files before sandboxing itself can make sense wrt to the thr=
eat
> > > model (i.e. if the potential attacker cannot interact with the proces=
s
> > > at this time).  However, you should try to open the tap device before
> > > the sandboxing and keep the related file descriptor open.  This way y=
ou
> > > don't need to bother with the file path of the tap device and you avo=
id
> > > other potential issues.
> >
> > Thanks for the clarification. I'm new to developing "secure programs"
> > and still need to learn how to create (useful) threat models.
> >
> > > > 3. Lockland introduces scoped access control starting with ABI 6. T=
o
> > > > avoid getting warnings from the compiler (and linter), I need to kn=
ow
> > > > whether the struct landlock_ruleset_attr has scoped access control =
or
> > > > not when programming. Since I only want to support the case where t=
his
> > > > is true, I would like to check the ABI version at compile time and
> > > > generate a more meaningful error. How can I check the ABI version a=
t
> > > > compile time? Is there a macro for this?
> > >
> > > Checking the ABI version at build time is not recommended because it
> > > doesn't give any guarantee about the ABI version at run time.  That's
> > > why the ABI should be a dynamic check.
> >
> > But I would like to have a build-time guarantee that certain data
> > structures are available in a certain form or that certain macros
> > exist. Hence my question about build-time checking.
>
> You can check the size of a struct at build time, and then infer which
> fields are part of it.  We should probably add some helpers to make this
> simpler.
>
> It's OK to just copy the header file though.  You'll need to update the
> code to leverage new features anyway.
>
> >
> > > > Currently, I am using a check to see if the compiler can compile th=
e
> > > > struct with `scoped`. [5] However, I don't think this is very elega=
nt.
> > >
> > > If the scoped field is defined, then you should use it and update it =
at
> > > runtime according to the current Landlock ABI.  See the sandboxer.c
> > > example for such case.
> >
> > But that assumes that the field exists at build time, and that's
> > exactly what I want to check.
>
> sizeof() should help.
>
> >
> > If I try to initialize a non-existent field, there should be an error
> > from the compiler (so I want to catch that beforehand). And if I don't
> > initialize an existing field, clang-tidy complains.
>
> You should always initialize the Landlock structs to zero, otherwise
> you'll get undefined behavior (depending on the content of the stack).
> We can initialize a whole struct with empty curly braces e.g.:
>
>   struct landlock_ruleset_attr ruleset_attr =3D {};
>
> >
> > As far as I can tell, sandboxer.c always assumes at build time that it
> > has been compiled with a new version. Or am I overlooking something?
>
> That's correct, and it's the case because the landlock.h file is always
> provided with this example, part of the Linux repository.
