Received: from saaz.rutschle.net (saaz.rutschle.net [51.15.243.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0970912293
	for <landlock@lists.linux.dev>; Mon,  7 Nov 2022 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=rutschle.net; s=20170610; h=Content-Type:MIME-Version:Message-ID:Subject:To
	:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MnRHjYAydl30DSjYWJq7rzHKXYszsPSA16F886FaCcU=; b=fmfyI7iAja1qgWD+skYxuUtztU
	NLECw7q03iQFLsKjWNTiNTf0XbUy2zHao0ju1DD74hkcNByKkcbQ47tR2w+1Eav80aev1uY90+eWU
	yIOmwQVjHNV+64+cUc3KJoFsMcRkDHUYLoEiWviSXCEW1rCe7QK3HkO1jWSjJ+x6gjfo=;
Received: from yves by saaz.rutschle.net with local (Exim 4.92)
	(envelope-from <yves@rutschle.net>)
	id 1os5pA-0004Zi-37
	for landlock@lists.linux.dev; Mon, 07 Nov 2022 17:22:16 +0000
Date: Mon, 7 Nov 2022 17:22:16 +0000
From: Yves Rutschle <landlock@rutschle.net>
To: landlock@lists.linux.dev
Subject: Landlock setup
Message-ID: <20221107172216.GA10688@rutschle.net>
Mail-Followup-To: landlock@lists.linux.dev
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello everyone,

Following Mickael's presentation of Landlock at
Pass-the-Salt 2022, I intend to add support for it to sslh.

I'm starting from the beginning: compiling and running the
example, which so far complains the LSM is not loaded, when
the kernel tells me it is...

I'm running a stock Debian where I manually add landlock to
the command line:

[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.18.0-3-amd64 root=UUID=79c3bdf6-4be2-46d6-b006-bb17170247b1 ro quiet lsm=landlock

the kernel indicates the LSM is started:

[    0.076550] LSM: Security Framework initializing
[    0.076559] landlock: Up and running.


Yet running the example fails:

# LL_FS_RO="/bin:/lib:/usr:/proc:/etc:/dev/urandom" LL_FS_RW="/dev/null:/dev/full:/dev/zero:/dev/pts:/tmp" ./lock bash -i
Failed to check Landlock compatibility: Function not implemented
Hint: Landlock is not supported by the current kernel. To support it, build the kernel with CONFIG_SECURITY_LANDLOCK=y and prepend "landlock," to the content of CONFIG_LSM.



What would I be doing wrong?

Cheers,
Y.



