Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31C9C8F3
	for <landlock@lists.linux.dev>; Sat,  9 Dec 2023 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="iUVv4IBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1702113531; bh=QeeoGXOhIzL2d8AVgbhoMItOqRRX1XyVm+Ms65+UASg=;
	h=Date:From:To:Subject:From;
	b=iUVv4IBri2CaNlWrGJIU5lnOb2nYbJswc+v+zJSOBtxOq7iUlK+g3OmGrp+KySahX
	 qpMCt/HIS20+rMQcsg7Sz/AufFlEJZwBhdRNc6slPNuLKIXnjXkbGMHtOy6iYSlxHd
	 x0PED1dzkdmZBgYbkzDU3e0NHVekIyNNRiCfmmaM=
Date: Sat, 9 Dec 2023 10:18:50 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: landlock@lists.linux.dev
Subject: Landlock support in setpriv(1)
Message-ID: <6cebaa86-f2ad-423d-a189-e3cf7ee5f4d4@t-8ch.de>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everybody,

For your information:

There is a proposal to add landlock support to setpriv(1) from
util-linux.
While landlock is meant for self-sandboxing it can also be used to
sandbox third party executables which makes it a nice fit for setpriv.

If you have any remarks let me know.

Link to the PR:
https://github.com/util-linux/util-linux/pull/2628


Thomas
