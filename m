Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7A490BF9
	for <landlock@lists.linux.dev>; Mon,  5 Oct 2026 18:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226519; cv=pass; b=f9K0YFmxNAYTBkzuFAwRGjlxogNs2ZwFZkmQ5vXlFv8NBBuaCDNIlcfINMMFa27gkphIVELe5aDkGBWu0UnY7XrzGqQqBphaJXuWtk/6OCPaz8NRZW7LUKOZVnxYpp7/Ng9nOj9d79qpiFTZwKI7Tx3FYrDga9KBXZqdOoHn6Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226519; c=relaxed/simple;
	bh=+1C0qXcsE40jRYlzsbxDkFLcctd/iao6md0OaMGh23Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIzie22zueQ17+4N0TRNPPWcdiIxEeUPvCrRLM4ZLF5o+0jAiT2KIHZvNsFp4SUY9J0RSiwXZtg3J9zCHDxZiC6XCOsoVtqxGtiNilHROTFP4KlRQaqxbWFjx9wxpL5OZ8EFdcI9c41AkfIciT3BLZx4Z6Dazj7E149g9wI6deY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2bQvzwm; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2bQvzwm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-486e70f2457so926473f8f.2
        for <landlock@lists.linux.dev>; Mon, 05 Oct 2026 11:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791226516; cv=none;
        d=google.com; s=arc-20260327;
        b=IQKebbkKAD8OMRQuqFkm5g3D8Ct8J+mtrga/aHnZh+D89hIgTxtYjDGbYtZZAX2Xai
         NFiFsoSdQdTXCtyLuHSyhF0afAo5VDfp5AOV5bkfB/c3bLM8ri8nQ5is3W2Uzsh83USj
         AmPF9Vde9oYEeA3xwuPWeddjDiw4/v387WVrF25WneXr2VFwmeqChPVk6l9adzFCuH0e
         1I85MzMlk81edvLCy8boWUCluz7fq2+f4B+Kui0Byxl1J+eGkeLokm+2Dj8cRNB3AMaX
         3aAnO+ofiLZbU1vfLCANdA+1IRD4vxRFrwGF6qN4teNtSjdFoyJaP0Ux+sJHTqSA5MZd
         re+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8KfSFh8zerT526a6JQN0vmwwUy9Qw5LxmDIoQXk9CEE=;
        fh=L7UXyfyNH65t5gihPGBEEClJMeEnMwdVdeoCt2nX+f8=;
        b=gfDYU2WAZzm4hwWAo03AOyjD/I5NMG8SQkwV74U9ynJN+Y+8S0uNaAQ3kvEOiXM1RF
         RRbr3tQptRcBPYVxGKm/UKNWTp+uvbeJVC3ThH8wcwg2Q9kicAqxJKjIVLMqlAcnobRW
         Dp+ZG6PixNpEq2z/4UmooE5KsjbEb83fdWzAsG/lfzbHdRywNRUY4la66wWhM4ma2Flw
         TLanTj1HmCfJNJnSYMdxDVBMyha0YDVYnxUj8wD+vovDknVrbP/Hn3tm0dE4fLghSwbo
         C+DqsnBa3EwVnTv6leBmLWfxKBgcPdzN2nJyGwQPOmyhFqagYejnVfyYlZ6wLRYzKKis
         uxYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226516; x=1791831316; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8KfSFh8zerT526a6JQN0vmwwUy9Qw5LxmDIoQXk9CEE=;
        b=X2bQvzwmISWV+2Zkcoyeyjhge257yP1jfm4sCVvKbQo8j4PT44KQA4k0/u2jSErAgE
         qoZUnwPBtUegAqP2ULjNASeQ7w584dTLwhR315fFnHVzmcyZidei/tSmAKAM4gmxxXBj
         sgSu2pJkO2kW7wj/caztSwQC4kowo5W+ZxtAivAxCHJuVG1Aff//epqbFC0mRpFYETS9
         09bd4v+Je/MfM9ZH7f2pMKrvnnvxvf1B9i9LlMM+pM2ORnuRJ0trf/IUKVD3afWXhQOp
         DsRDG7ixF4MuQRociV0Wafs90umO8ipiIgnoENOzgAtiJx3NT84WSy9YjhoTOTMtcwJW
         F9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226516; x=1791831316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KfSFh8zerT526a6JQN0vmwwUy9Qw5LxmDIoQXk9CEE=;
        b=ppx8I6F/RA7n1HrQG0DIClZ5pICOg0nd72kk3RKDVvsuU3ApVubeaSiQWmAWK/x8+5
         TWUljTDxfn4l7KJJwweUE2rFuVWIE4bg+HsOopdk68ccOb61b9uT9qnhWIrZWdhIuAPk
         qC97sL8MwHpG737x4ea4fEkzBDC9EVFa9XnDM+z6AZmetKDuyUZlZrEALME26WpZPkfF
         3K7Yj9YqCvrGe6JGQ9D/fBolcCMeBj3CqrwzKt0/xN6URcE/q/J9Xf7M0hoNVSjRp+AD
         yPymoO0HTlTADmH/28/q1uCF+6ojXZd6MRU1KaZ3MesM2a8yDDuAsBsu35mF0FByi1Hf
         r3Xg==
X-Forwarded-Encrypted: i=1; AKwUvBxhAANhtqubfA8n3VzlT8YmQJ0E5ldlHx0+ojKRzhrGOasJGWsTUswBC1B1OlrBvsdGA32cVMO3dA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLJA3N276JQaFTFeympxokDkjVkd1MPeFFaPIo3vtgiBpxqy4vy
	5/SOfYZaKPKD0qCtwA+8jK411yG1HhqslDwQl1X5ge1975/0+rg2stHVghEzBM271aT6Yqu9Xrd
	jGKVbwE41PqzUdJXjCQe/v4oDC67hW93t0vJP
X-Gm-Gg: AYBFou2gzEJZVx/KzfV5llWnGtnZIQtJ7tZlJUiV/yNdeIBYnSHSqxIdrHHo/VNP8mc
	x2kpJiT+VEkhn0i6/6cj24L5n2zGk4Z++uk1Ze/Ybuw2tOjsmjw9vgcOJBJkZTb357rInXtD5Pv
	kiYQAxtn73MJOpvVBpibX2yk+401xlJoTJLcW/SHSIeWNOvYctK6bYlgHcgXh5RlIsi0wlPhAtL
	flskB9bAdHs7ECz19L0MuIqyTJ/UkjgTDTj2IhUmLZ2l8JXEGZJ7N8/LpIz6VbdJ14QbrCCamvK
	1YgJDKH1pE6g7rLe/n8lYgNXUEWqhw93/gH9AUJXLzl3LJwBcrw4jmpovqaZ8TTcRkvYuXoM46e
	ImESRpNkE
X-Received: by 2002:a05:6000:200a:b0:487:b2b:457b with SMTP id
 ffacd0b85a97d-48c47fc9073mr16813619f8f.15.1791226516368; Mon, 05 Oct 2026
 11:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bff77061-37e3-4361-b021-3d1e46be3b87@exn.st> <ara5OnFKQCidTeWx@suesslenovo>
In-Reply-To: <ara5OnFKQCidTeWx@suesslenovo>
From: =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Mon, 5 Oct 2026 20:55:05 +0200
X-Gm-Features: AclHuK-FRSbfT_y2swGxmyx8K9Zp_uzselaYpqNh91wwWUUjrlgGyvURKLEpxxM
Message-ID: <CAAnnc9zMpraV1Rnn8y-Zc8F-ShNRhCHbgm6-raH65a6aoDU4Rw@mail.gmail.com>
Subject: Re: Restricting all (ICMP included) network access
To: Justin Suess <utilityemal77@gmail.com>
Cc: Kate <kit-ty-kate@exn.st>, landlock@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Fri, Sep 25, 2026 at 8:20=E2=80=AFPM Justin Suess <utilityemal77@gmail.c=
om> wrote:
> On Wed, Sep 23, 2026 at 11:28:57PM +0100, Kate wrote:
> > I'd like to use landlock and i've tested the sample/landlock/sandboxer.=
c
> > example from the linux sources, however while TCP and UDP (if i had lin=
ux >=3D
> > 7.2 / API >=3D 10) are correctly restricted from what i can see, ICMP (=
ping)
> > is still able to communicate with the rest of the world. I suspect othe=
r
> > protocols not based on TCP/UDP are able to do so as well.
> >
> > I've read somewhere that ICMP can be handled by BFP instead but that AP=
I
> > seems a lot more complicated than necessary for what i need (maybe i've
> > looked in the wrong places though?), so i'm wondering:
> >
> > Does anyone has any tips on how to make sure no network access of any k=
ind
> > is able leave the sandbox?
> >
> Hi,
>
> This doesn't use Landlock, but you can use unshare and create a new
> user namespace and an empty network namespace without root.
>
> You can demonstrate this with the unshare -Un command.
>
> For ICMP specifically, it already requires CAP_NET_RAW if I'm
> not mistaken. (usually the ping binary is setuid or has file
> capabilities for CAP_NET_RAW which is what allows unprivileged ping).
> So you can drop that capability if you already have it, or set no new
> privs (already required for non-root Landlock usage) to prevent
> regaining it through the ping / other setuid binaries.
>
> There's currently no ICMP right specifically for Landlock.
>
> But yes, you can achieve this, without even needing BPF or Landlock.

To augment this -- It would indeed be good for Landlock completeness
if we could restrict socket creation with Landlock as well.
We are tracking that feature in https://github.com/landlock-lsm/linux/issue=
s/6.

With this feature, Landlock would restrict invocations of socket(2)
(and equivalent operations) by default and allow them based on an
allow-list of permitted protocols (specified through address family,
socket type and protocol).  It's similar to using Seccomp-BPF, but it
does not require you to manage syscall numbers.

If you are happy with using Seccomp, you can also use libseccomp
today, which simplifies that filter creation:
https://github.com/seccomp/libseccomp

=E2=80=94G=C3=BCnther
