Received: from saaz.rutschle.net (saaz.rutschle.net [51.15.243.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A39EACD
	for <landlock@lists.linux.dev>; Sun,  8 Sep 2024 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.15.243.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725810432; cv=none; b=dyGK2qdOFlLaO2kRekOmn9wx0D7Zq54sbMY0cSeiYGsfRZ7h6LIkdiXI9/uW6szbrc/XOgrmYQjIP5BRam74Ls1ZrmcuUEdave49aI7kml1C7xUmC8/r0/W0j6AM6622SmdaKbrlNytXoK+LdNYneU9hhz/vD5LU6SuqFrH51qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725810432; c=relaxed/simple;
	bh=Ydh0LSuBkeTj7lC5B76xarism3SMev/Y8X6HLfNN7H0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sybJfJSP72pC//sYSEjBfvkThB5TO0uX6LQHLz7CAC5Kh9IF+akfXPOk+xfzzZV3746CaJiyu6d2O/SxWAispEnMuJaDDEA+m0TVPIds7Hgp7nOrUOAMJ9zg5b/BNkU91D9DWGssegISxTNPvvVf4iMuKWclNnra2hO4O0jD9/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rutschle.net; spf=pass smtp.mailfrom=rutschle.net; dkim=pass (1024-bit key) header.d=rutschle.net header.i=@rutschle.net header.b=pHVExZH2; arc=none smtp.client-ip=51.15.243.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rutschle.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rutschle.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rutschle.net header.i=@rutschle.net header.b="pHVExZH2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=rutschle.net; s=20170610; h=Content-Type:MIME-Version:Message-ID:Subject:To
	:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ydh0LSuBkeTj7lC5B76xarism3SMev/Y8X6HLfNN7H0=; b=pHVExZH2hGl7rKC+WhotoUduZa
	NhzKLrkyAtMkYpB5DHucoKZtyNrJ3W10V19BYK6LCIbb4HEmOEXzznskNpYYJUclR33FAMtY3AbTP
	GYB9Xe2p/dqEnCMRjT2yGPusG81167oULF5+KUIqZyi5t/iLnp9bnszlfbqbNGJG7OFM=;
Received: from yves by localhost with local (Exim 4.96)
	(envelope-from <yves@rutschle.net>)
	id 1snJTB-005bGS-2f
	for landlock@lists.linux.dev;
	Sun, 08 Sep 2024 15:04:53 +0000
Date: Sun, 8 Sep 2024 15:04:53 +0000
From: Yves Rutschle <landlock@rutschle.net>
To: landlock@lists.linux.dev
Subject: Closing after landlock_add_rule?
Message-ID: <Zt29FXgAR3e5Uzb-@rutschle.net>
Mail-Followup-To: landlock@lists.linux.dev
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello all,

So far my code did not close the filehandles it uses to
create the fuleset using landlock_add_rule(). I recently
received a commit to close the file descriptors.

Does landlock use the file handles after the ruleset is
created, or is it ok to close them after? The man page does
not discuss this.

Cheers,
Y.


