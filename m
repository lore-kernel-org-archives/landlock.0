Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C8E1D130C
	for <landlock@lists.linux.dev>; Wed, 21 Aug 2024 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724242415; cv=none; b=qpFpmhj8xJ5KmBRTNxE1uYEQHiHH+3bBbaEqxsXUw2ROCARZlLuD1ZLKxfedr0v7xHANMu0gNhNioTfzEDmRv0E29SiPl4mzAmNKAppFDfD8Lz8mkMOhycyHTyUv6BFWBUWTSs/0Glj+By1TPBY9xpxFKAOx2prAms8RPy5DMNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724242415; c=relaxed/simple;
	bh=04EUN0vTFaxJZaANxvdL+z26NSlHFlr60g26S89F2H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THhscmT63b1GVkBH8xWoOdqtl36CmtQTJQcMyqIZVxUWnNfmj/chp0AFEsZvP7djXd+H360UH7P7DRYig+5YUg0VN7tjCeFhTotsvc5thaNxi81IFHoku3Hj1B2FS9HoxxTGXxpIpxhKOqU1JVr0icjzp1agS0J0xlfuApQDoRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=aUPuqaYy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=IWLvUuAK; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=aUPuqaYy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=IWLvUuAK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="aUPuqaYy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="IWLvUuAK";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="aUPuqaYy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="IWLvUuAK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B91F1222B7;
	Wed, 21 Aug 2024 12:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724242409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OQu9ivEqYyJ18Gzo5MiYbwToiEbiDFLtYMUYs8oqFhE=;
	b=aUPuqaYyVogFzYUFYB0N5Qu0LL091pW/t+Z/XirUQYZSqR5+18qBGESJAe1gVSsSYzMxxi
	YI2Vx8ih8xmqMpNH1f0dyWwr/igiUbWOJbn2uJgfVEVq85WLkZ6klY2Ga3NA3RaG6zzCk4
	xsT+r+yXGXCKQl7eEJCYabYmue81jw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724242409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OQu9ivEqYyJ18Gzo5MiYbwToiEbiDFLtYMUYs8oqFhE=;
	b=IWLvUuAKEvLnBGoLCwvh9xtZ94RKsQ5NnrfQ3kct9wT/YekHEKemRb3KOvXRH31szfq8OK
	jqwbA0nBh07zrnCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724242409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OQu9ivEqYyJ18Gzo5MiYbwToiEbiDFLtYMUYs8oqFhE=;
	b=aUPuqaYyVogFzYUFYB0N5Qu0LL091pW/t+Z/XirUQYZSqR5+18qBGESJAe1gVSsSYzMxxi
	YI2Vx8ih8xmqMpNH1f0dyWwr/igiUbWOJbn2uJgfVEVq85WLkZ6klY2Ga3NA3RaG6zzCk4
	xsT+r+yXGXCKQl7eEJCYabYmue81jw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724242409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OQu9ivEqYyJ18Gzo5MiYbwToiEbiDFLtYMUYs8oqFhE=;
	b=IWLvUuAKEvLnBGoLCwvh9xtZ94RKsQ5NnrfQ3kct9wT/YekHEKemRb3KOvXRH31szfq8OK
	jqwbA0nBh07zrnCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6A86139C2;
	Wed, 21 Aug 2024 12:13:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +RLZJ+nZxWaACQAAD6G6ig
	(envelope-from <chrubis@suse.cz>); Wed, 21 Aug 2024 12:13:29 +0000
Date: Wed, 21 Aug 2024 14:12:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Cc: ltp@lists.linux.it, landlock@lists.linux.dev
Subject: Re: [LTP] [PATCH v2 1/2] Add SAFE_KEYCTL macro
Message-ID: <ZsXZpIuRRgqkol0p@yuki.lan>
References: <20240821-landlock_houdini-v2-0-b46211ca64f9@suse.com>
 <20240821-landlock_houdini-v2-1-b46211ca64f9@suse.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821-landlock_houdini-v2-1-b46211ca64f9@suse.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.cz:email]
X-Spam-Score: -8.30
X-Spam-Flag: NO

Hi!
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
> + * Ccmdyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>

I suppose that you did replace op with cmd and corrupted this line.

>   */
>  
>  #ifndef LAPI_KEYCTL_H__
> @@ -179,4 +179,28 @@ static inline key_serial_t keyctl_join_session_keyring(const char *name) {
>  # define KEY_OTH_ALL     0x0000003f
>  #endif /* !KEY_POS_VIEW */
>  
> +static inline long safe_keyctl(const char *file, const int lineno,
> +	int cmd, unsigned long arg2, unsigned long arg3,
> +	unsigned long arg4, unsigned long arg5) 
                                               ^
					       trailing whitespaces

> +{
> +	long rval;
> +
> +	rval = keyctl(cmd, arg2, arg3, arg4, arg5);
> +	if (rval == -1) {
> +		tst_brk_(file, lineno, TBROK | TERRNO,
> +			"keyctl(%d, %lu, %lu, %lu, %lu)",
> +			cmd, arg2, arg3, arg4, arg5);
> +	} else if (rval < 0) {
> +		tst_brk_(file, lineno, TBROK | TERRNO,
> +			"Invalid keyctl(%d, %lu, %lu, %lu, %lu) "
> +			"return value %ld",
> +			cmd, arg2, arg3, arg4, arg5, rval);
> +	}

Looking at man 2 keyctl() we should fail for non-zero return value for
most of the operations but the ones listed in RETURN VALUE paragraph.

> +	return rval;
> +}
> +#define SAFE_KEYCTL(cmd, arg2, arg3, arg4, arg5) \
> +	safe_keyctl(__FILE__, __LINE__, \
> +	     (cmd), (arg2), (arg3), (arg4), (arg5))
> +
>  #endif	/* LAPI_KEYCTL_H__ */
> 
> -- 
> 2.43.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz
