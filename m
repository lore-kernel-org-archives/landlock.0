Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43E426281
	for <landlock@lists.linux.dev>; Sun,  8 Sep 2024 18:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725820514; cv=none; b=aPu1/0EHkA9G5tFt76ORe/HHa79gxMhBZV03RG7EMNloxy78Bj+G2KPFA/+Qr4EZqMrVUaOS769Rq2KaQVTp2C3SlTSZcu2JurcL+M0RejKbAz5Pn5WFaAAUAz/EbmKh9KN1Exzst8+R6WarEx6AeHovFlAPpxHLyewBzcWOLyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725820514; c=relaxed/simple;
	bh=M/rFQ4hmtD9C0fFHSZ7HCfJFLRmA0LXTYzkmaNfESx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvLFKPow6AQgRLRBHRBBgqrVGCgzoSjeEI0zWVqI3g7rOKHA0YafuTtxu6UTOWq/xfABDOESLUN2k2WItZItAnxtmc5Bv5ydasdDV0wPEQ07JDXIYDjcXnrpaQQtFzuRrj8++ok+/+vAA7swINto46dQA1axlLHBbVEV/WkE/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=QA56xpE2; arc=none smtp.client-ip=185.125.25.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="QA56xpE2"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4X1yNk2v1bzGp2;
	Sun,  8 Sep 2024 19:57:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1725818262;
	bh=+K5PCxVLvUmff25naKGX63dx1jiTDPDlX7woLUgPKEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QA56xpE2miGDKFgRdTKLTBQxBY55plR9gASzwEveoSb0VWou0MOlAMtmYnpdy2UfO
	 trbHUbDPRj6rRUR9KjYKG0g2Jn4fLHvoRLC30BhFCF/UJHM9lya3HgCaMnIIx00QY0
	 91a/eO0V7nKaxvmW6F4IPlBYzpsmICfxEvsCtVT4=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4X1yNj5sCdzdTX;
	Sun,  8 Sep 2024 19:57:41 +0200 (CEST)
Date: Sun, 8 Sep 2024 19:57:35 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Yves Rutschle <landlock@rutschle.net>
Cc: landlock@lists.linux.dev
Subject: Re: Closing after landlock_add_rule?
Message-ID: <20240908.Thu1cekagh2o@digikod.net>
References: <Zt29FXgAR3e5Uzb-@rutschle.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zt29FXgAR3e5Uzb-@rutschle.net>
X-Infomaniak-Routing: alpha

Hi Yves,

As for any other kind of file descriptor, a Landlock ruleset should be
closed when it is not used.  However, such a file descriptor cannot
change currently enforced rulesets, so it would not be a security issue
to "leak" it.

File descriptors used to define a Landlock rules (e.g. file opened for a
path_beneath rule) should be closed once the rule is added to the
Landlock ruleset, and leaking such file descriptor could let a sandboxed
process to still read/write such *opened* file.  To avoid such risk, it
is advised to open such files with O_PATH.

Regards,
 Mickaël

On Sun, Sep 08, 2024 at 03:04:53PM +0000, Yves Rutschle wrote:
> Hello all,
> 
> So far my code did not close the filehandles it uses to
> create the fuleset using landlock_add_rule(). I recently
> received a commit to close the file descriptors.
> 
> Does landlock use the file handles after the ruleset is
> created, or is it ok to close them after? The man page does
> not discuss this.
> 
> Cheers,
> Y.
> 
> 
> 
