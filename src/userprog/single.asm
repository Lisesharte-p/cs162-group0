
build/tests/userprog/args-single：     文件格式 elf32-i386


Disassembly of section .text:

08048094 <main>:
 8048094:	55                   	push   %ebp
 8048095:	89 e5                	mov    %esp,%ebp
 8048097:	83 e4 f0             	and    $0xfffffff0,%esp
 804809a:	83 ec 20             	sub    $0x20,%esp
 804809d:	c7 05 00 cb 04 08 60 	movl   $0x804b360,0x804cb00
 80480a4:	b3 04 08 
 80480a7:	c7 04 24 65 b3 04 08 	movl   $0x804b365,(%esp)
 80480ae:	e8 ac 01 00 00       	call   804825f <msg>
 80480b3:	8b 45 08             	mov    0x8(%ebp),%eax
 80480b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80480ba:	c7 04 24 6b b3 04 08 	movl   $0x804b36b,(%esp)
 80480c1:	e8 99 01 00 00       	call   804825f <msg>
 80480c6:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
 80480cd:	00 
 80480ce:	eb 5a                	jmp    804812a <main+0x96>
 80480d0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 80480d4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 80480db:	8b 45 0c             	mov    0xc(%ebp),%eax
 80480de:	01 d0                	add    %edx,%eax
 80480e0:	8b 00                	mov    (%eax),%eax
 80480e2:	85 c0                	test   %eax,%eax
 80480e4:	74 2c                	je     8048112 <main+0x7e>
 80480e6:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 80480ea:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 80480f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80480f4:	01 d0                	add    %edx,%eax
 80480f6:	8b 00                	mov    (%eax),%eax
 80480f8:	89 44 24 08          	mov    %eax,0x8(%esp)
 80480fc:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 8048100:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048104:	c7 04 24 75 b3 04 08 	movl   $0x804b375,(%esp)
 804810b:	e8 4f 01 00 00       	call   804825f <msg>
 8048110:	eb 14                	jmp    8048126 <main+0x92>
 8048112:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 8048116:	89 44 24 04          	mov    %eax,0x4(%esp)
 804811a:	c7 04 24 85 b3 04 08 	movl   $0x804b385,(%esp)
 8048121:	e8 39 01 00 00       	call   804825f <msg>
 8048126:	ff 44 24 1c          	incl   0x1c(%esp)
 804812a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 804812e:	3b 45 08             	cmp    0x8(%ebp),%eax
 8048131:	7e 9d                	jle    80480d0 <main+0x3c>
 8048133:	c7 04 24 95 b3 04 08 	movl   $0x804b395,(%esp)
 804813a:	e8 20 01 00 00       	call   804825f <msg>
 804813f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048144:	89 ec                	mov    %ebp,%esp
 8048146:	5d                   	pop    %ebp
 8048147:	c3                   	ret

08048148 <fpu_push>:
 8048148:	55                   	push   %ebp
 8048149:	89 e5                	mov    %esp,%ebp
 804814b:	ff 75 08             	push   0x8(%ebp)
 804814e:	d9 04 24             	flds   (%esp)
 8048151:	83 c4 04             	add    $0x4,%esp
 8048154:	90                   	nop
 8048155:	5d                   	pop    %ebp
 8048156:	c3                   	ret

08048157 <fpu_pop>:
 8048157:	55                   	push   %ebp
 8048158:	89 e5                	mov    %esp,%ebp
 804815a:	83 ec 10             	sub    $0x10,%esp
 804815d:	83 ec 04             	sub    $0x4,%esp
 8048160:	d9 1c 24             	fstps  (%esp)
 8048163:	8b 04 24             	mov    (%esp),%eax
 8048166:	83 c4 04             	add    $0x4,%esp
 8048169:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804816c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804816f:	89 ec                	mov    %ebp,%esp
 8048171:	5d                   	pop    %ebp
 8048172:	c3                   	ret

08048173 <console_init>:
 8048173:	55                   	push   %ebp
 8048174:	89 e5                	mov    %esp,%ebp
 8048176:	83 ec 18             	sub    $0x18,%esp
 8048179:	c7 04 24 06 cb 04 08 	movl   $0x804cb06,(%esp)
 8048180:	e8 4a 02 00 00       	call   80483cf <lock_check_init>
 8048185:	90                   	nop
 8048186:	89 ec                	mov    %ebp,%esp
 8048188:	5d                   	pop    %ebp
 8048189:	c3                   	ret

0804818a <vmsg>:
 804818a:	55                   	push   %ebp
 804818b:	89 e5                	mov    %esp,%ebp
 804818d:	83 ec 18             	sub    $0x18,%esp
 8048190:	89 5d fc             	mov    %ebx,-0x4(%ebp)
 8048193:	a1 00 cb 04 08       	mov    0x804cb00,%eax
 8048198:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804819c:	c7 44 24 08 9c b3 04 	movl   $0x804b39c,0x8(%esp)
 80481a3:	08 
 80481a4:	c7 44 24 04 00 04 00 	movl   $0x400,0x4(%esp)
 80481ab:	00 
 80481ac:	c7 04 24 20 cb 04 08 	movl   $0x804cb20,(%esp)
 80481b3:	e8 ba 0a 00 00       	call   8048c72 <snprintf>
 80481b8:	c7 04 24 20 cb 04 08 	movl   $0x804cb20,(%esp)
 80481bf:	e8 30 23 00 00       	call   804a4f4 <strlen>
 80481c4:	ba 00 04 00 00       	mov    $0x400,%edx
 80481c9:	89 d3                	mov    %edx,%ebx
 80481cb:	29 c3                	sub    %eax,%ebx
 80481cd:	c7 04 24 20 cb 04 08 	movl   $0x804cb20,(%esp)
 80481d4:	e8 1b 23 00 00       	call   804a4f4 <strlen>
 80481d9:	8d 90 20 cb 04 08    	lea    0x804cb20(%eax),%edx
 80481df:	8b 45 0c             	mov    0xc(%ebp),%eax
 80481e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80481e6:	8b 45 08             	mov    0x8(%ebp),%eax
 80481e9:	89 44 24 08          	mov    %eax,0x8(%esp)
 80481ed:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80481f1:	89 14 24             	mov    %edx,(%esp)
 80481f4:	e8 db 09 00 00       	call   8048bd4 <vsnprintf>
 80481f9:	c7 04 24 20 cb 04 08 	movl   $0x804cb20,(%esp)
 8048200:	e8 ef 22 00 00       	call   804a4f4 <strlen>
 8048205:	ba 00 04 00 00       	mov    $0x400,%edx
 804820a:	89 d3                	mov    %edx,%ebx
 804820c:	29 c3                	sub    %eax,%ebx
 804820e:	c7 04 24 20 cb 04 08 	movl   $0x804cb20,(%esp)
 8048215:	e8 da 22 00 00       	call   804a4f4 <strlen>
 804821a:	8d 90 20 cb 04 08    	lea    0x804cb20(%eax),%edx
 8048220:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8048224:	8b 45 10             	mov    0x10(%ebp),%eax
 8048227:	89 44 24 04          	mov    %eax,0x4(%esp)
 804822b:	89 14 24             	mov    %edx,(%esp)
 804822e:	e8 4a 23 00 00       	call   804a57d <strlcpy>
 8048233:	c7 04 24 20 cb 04 08 	movl   $0x804cb20,(%esp)
 804823a:	e8 b5 22 00 00       	call   804a4f4 <strlen>
 804823f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048243:	c7 44 24 04 20 cb 04 	movl   $0x804cb20,0x4(%esp)
 804824a:	08 
 804824b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048252:	e8 5b 2b 00 00       	call   804adb2 <write>
 8048257:	90                   	nop
 8048258:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 804825b:	89 ec                	mov    %ebp,%esp
 804825d:	5d                   	pop    %ebp
 804825e:	c3                   	ret

0804825f <msg>:
 804825f:	55                   	push   %ebp
 8048260:	89 e5                	mov    %esp,%ebp
 8048262:	83 ec 28             	sub    $0x28,%esp
 8048265:	0f b6 05 04 cb 04 08 	movzbl 0x804cb04,%eax
 804826c:	84 c0                	test   %al,%al
 804826e:	75 50                	jne    80482c0 <msg+0x61>
 8048270:	0f b6 05 05 cb 04 08 	movzbl 0x804cb05,%eax
 8048277:	84 c0                	test   %al,%al
 8048279:	74 0c                	je     8048287 <msg+0x28>
 804827b:	c7 04 24 06 cb 04 08 	movl   $0x804cb06,(%esp)
 8048282:	e8 ff 2c 00 00       	call   804af86 <lock_acquire>
 8048287:	8d 45 0c             	lea    0xc(%ebp),%eax
 804828a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804828d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048290:	c7 44 24 08 a2 b3 04 	movl   $0x804b3a2,0x8(%esp)
 8048297:	08 
 8048298:	89 44 24 04          	mov    %eax,0x4(%esp)
 804829c:	8b 45 08             	mov    0x8(%ebp),%eax
 804829f:	89 04 24             	mov    %eax,(%esp)
 80482a2:	e8 e3 fe ff ff       	call   804818a <vmsg>
 80482a7:	0f b6 05 05 cb 04 08 	movzbl 0x804cb05,%eax
 80482ae:	84 c0                	test   %al,%al
 80482b0:	74 0f                	je     80482c1 <msg+0x62>
 80482b2:	c7 04 24 06 cb 04 08 	movl   $0x804cb06,(%esp)
 80482b9:	e8 01 2d 00 00       	call   804afbf <lock_release>
 80482be:	eb 01                	jmp    80482c1 <msg+0x62>
 80482c0:	90                   	nop
 80482c1:	89 ec                	mov    %ebp,%esp
 80482c3:	5d                   	pop    %ebp
 80482c4:	c3                   	ret

080482c5 <fail>:
 80482c5:	55                   	push   %ebp
 80482c6:	89 e5                	mov    %esp,%ebp
 80482c8:	83 ec 28             	sub    $0x28,%esp
 80482cb:	8d 45 0c             	lea    0xc(%ebp),%eax
 80482ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80482d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80482d4:	c7 44 24 08 a4 b3 04 	movl   $0x804b3a4,0x8(%esp)
 80482db:	08 
 80482dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 80482e0:	8b 45 08             	mov    0x8(%ebp),%eax
 80482e3:	89 04 24             	mov    %eax,(%esp)
 80482e6:	e8 9f fe ff ff       	call   804818a <vmsg>
 80482eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80482f2:	e8 b6 29 00 00       	call   804acad <exit>

080482f7 <swap>:
 80482f7:	55                   	push   %ebp
 80482f8:	89 e5                	mov    %esp,%ebp
 80482fa:	83 ec 10             	sub    $0x10,%esp
 80482fd:	8b 45 08             	mov    0x8(%ebp),%eax
 8048300:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8048303:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048306:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048309:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048310:	eb 34                	jmp    8048346 <swap+0x4f>
 8048312:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8048315:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048318:	01 d0                	add    %edx,%eax
 804831a:	0f b6 00             	movzbl (%eax),%eax
 804831d:	88 45 f3             	mov    %al,-0xd(%ebp)
 8048320:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048323:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048326:	01 c2                	add    %eax,%edx
 8048328:	8b 4d f8             	mov    -0x8(%ebp),%ecx
 804832b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804832e:	01 c8                	add    %ecx,%eax
 8048330:	0f b6 12             	movzbl (%edx),%edx
 8048333:	88 10                	mov    %dl,(%eax)
 8048335:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048338:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804833b:	01 d0                	add    %edx,%eax
 804833d:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
 8048341:	88 10                	mov    %dl,(%eax)
 8048343:	ff 45 fc             	incl   -0x4(%ebp)
 8048346:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048349:	3b 45 10             	cmp    0x10(%ebp),%eax
 804834c:	72 c4                	jb     8048312 <swap+0x1b>
 804834e:	90                   	nop
 804834f:	90                   	nop
 8048350:	89 ec                	mov    %ebp,%esp
 8048352:	5d                   	pop    %ebp
 8048353:	c3                   	ret

08048354 <push_values_to_fpu>:
 8048354:	55                   	push   %ebp
 8048355:	89 e5                	mov    %esp,%ebp
 8048357:	83 ec 14             	sub    $0x14,%esp
 804835a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048361:	eb 1c                	jmp    804837f <push_values_to_fpu+0x2b>
 8048363:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048366:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 804836d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048370:	01 d0                	add    %edx,%eax
 8048372:	8b 00                	mov    (%eax),%eax
 8048374:	89 04 24             	mov    %eax,(%esp)
 8048377:	e8 cc fd ff ff       	call   8048148 <fpu_push>
 804837c:	ff 45 fc             	incl   -0x4(%ebp)
 804837f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048382:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048385:	7c dc                	jl     8048363 <push_values_to_fpu+0xf>
 8048387:	90                   	nop
 8048388:	90                   	nop
 8048389:	89 ec                	mov    %ebp,%esp
 804838b:	5d                   	pop    %ebp
 804838c:	c3                   	ret

0804838d <pop_values_from_fpu>:
 804838d:	55                   	push   %ebp
 804838e:	89 e5                	mov    %esp,%ebp
 8048390:	83 ec 14             	sub    $0x14,%esp
 8048393:	89 5d fc             	mov    %ebx,-0x4(%ebp)
 8048396:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048399:	48                   	dec    %eax
 804839a:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804839d:	eb 21                	jmp    80483c0 <pop_values_from_fpu+0x33>
 804839f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80483a2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 80483a9:	8b 45 08             	mov    0x8(%ebp),%eax
 80483ac:	01 d0                	add    %edx,%eax
 80483ae:	8b 18                	mov    (%eax),%ebx
 80483b0:	e8 a2 fd ff ff       	call   8048157 <fpu_pop>
 80483b5:	39 c3                	cmp    %eax,%ebx
 80483b7:	74 04                	je     80483bd <pop_values_from_fpu+0x30>
 80483b9:	b0 00                	mov    $0x0,%al
 80483bb:	eb 0b                	jmp    80483c8 <pop_values_from_fpu+0x3b>
 80483bd:	ff 4d f8             	decl   -0x8(%ebp)
 80483c0:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
 80483c4:	79 d9                	jns    804839f <pop_values_from_fpu+0x12>
 80483c6:	b0 01                	mov    $0x1,%al
 80483c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80483cb:	89 ec                	mov    %ebp,%esp
 80483cd:	5d                   	pop    %ebp
 80483ce:	c3                   	ret

080483cf <lock_check_init>:
 80483cf:	55                   	push   %ebp
 80483d0:	89 e5                	mov    %esp,%ebp
 80483d2:	83 ec 18             	sub    $0x18,%esp
 80483d5:	8b 45 08             	mov    0x8(%ebp),%eax
 80483d8:	89 04 24             	mov    %eax,(%esp)
 80483db:	e8 87 2b 00 00       	call   804af67 <lock_init>
 80483e0:	34 01                	xor    $0x1,%al
 80483e2:	84 c0                	test   %al,%al
 80483e4:	74 0c                	je     80483f2 <lock_check_init+0x23>
 80483e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80483ed:	e8 bb 28 00 00       	call   804acad <exit>
 80483f2:	90                   	nop
 80483f3:	89 ec                	mov    %ebp,%esp
 80483f5:	5d                   	pop    %ebp
 80483f6:	c3                   	ret

080483f7 <sema_check_init>:
 80483f7:	55                   	push   %ebp
 80483f8:	89 e5                	mov    %esp,%ebp
 80483fa:	83 ec 18             	sub    $0x18,%esp
 80483fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048400:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048404:	8b 45 08             	mov    0x8(%ebp),%eax
 8048407:	89 04 24             	mov    %eax,(%esp)
 804840a:	e8 e9 2b 00 00       	call   804aff8 <sema_init>
 804840f:	34 01                	xor    $0x1,%al
 8048411:	84 c0                	test   %al,%al
 8048413:	74 0c                	je     8048421 <sema_check_init+0x2a>
 8048415:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804841c:	e8 8c 28 00 00       	call   804acad <exit>
 8048421:	90                   	nop
 8048422:	89 ec                	mov    %ebp,%esp
 8048424:	5d                   	pop    %ebp
 8048425:	c3                   	ret

08048426 <pthread_check_join>:
 8048426:	55                   	push   %ebp
 8048427:	89 e5                	mov    %esp,%ebp
 8048429:	83 ec 18             	sub    $0x18,%esp
 804842c:	8b 45 08             	mov    0x8(%ebp),%eax
 804842f:	89 04 24             	mov    %eax,(%esp)
 8048432:	e8 b4 2c 00 00       	call   804b0eb <pthread_join>
 8048437:	34 01                	xor    $0x1,%al
 8048439:	84 c0                	test   %al,%al
 804843b:	74 0c                	je     8048449 <pthread_check_join+0x23>
 804843d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048444:	e8 64 28 00 00       	call   804acad <exit>
 8048449:	90                   	nop
 804844a:	89 ec                	mov    %ebp,%esp
 804844c:	5d                   	pop    %ebp
 804844d:	c3                   	ret

0804844e <pthread_check_create>:
 804844e:	55                   	push   %ebp
 804844f:	89 e5                	mov    %esp,%ebp
 8048451:	83 ec 28             	sub    $0x28,%esp
 8048454:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048457:	89 44 24 04          	mov    %eax,0x4(%esp)
 804845b:	8b 45 08             	mov    0x8(%ebp),%eax
 804845e:	89 04 24             	mov    %eax,(%esp)
 8048461:	e8 56 2c 00 00       	call   804b0bc <pthread_create>
 8048466:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048469:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 804846d:	75 0c                	jne    804847b <pthread_check_create+0x2d>
 804846f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048476:	e8 32 28 00 00       	call   804acad <exit>
 804847b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804847e:	89 ec                	mov    %ebp,%esp
 8048480:	5d                   	pop    %ebp
 8048481:	c3                   	ret

08048482 <shuffle>:
 8048482:	55                   	push   %ebp
 8048483:	89 e5                	mov    %esp,%ebp
 8048485:	83 ec 28             	sub    $0x28,%esp
 8048488:	8b 45 08             	mov    0x8(%ebp),%eax
 804848b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804848e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048495:	eb 4f                	jmp    80484e6 <shuffle+0x64>
 8048497:	e8 de 06 00 00       	call   8048b7a <random_ulong>
 804849c:	8b 55 0c             	mov    0xc(%ebp),%edx
 804849f:	89 d1                	mov    %edx,%ecx
 80484a1:	2b 4d f4             	sub    -0xc(%ebp),%ecx
 80484a4:	ba 00 00 00 00       	mov    $0x0,%edx
 80484a9:	f7 f1                	div    %ecx
 80484ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484ae:	01 d0                	add    %edx,%eax
 80484b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80484b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80484b6:	0f af 45 10          	imul   0x10(%ebp),%eax
 80484ba:	89 c2                	mov    %eax,%edx
 80484bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80484bf:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 80484c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484c5:	0f af 45 10          	imul   0x10(%ebp),%eax
 80484c9:	89 c2                	mov    %eax,%edx
 80484cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80484ce:	01 c2                	add    %eax,%edx
 80484d0:	8b 45 10             	mov    0x10(%ebp),%eax
 80484d3:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484d7:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 80484db:	89 14 24             	mov    %edx,(%esp)
 80484de:	e8 14 fe ff ff       	call   80482f7 <swap>
 80484e3:	ff 45 f4             	incl   -0xc(%ebp)
 80484e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484e9:	3b 45 0c             	cmp    0xc(%ebp),%eax
 80484ec:	72 a9                	jb     8048497 <shuffle+0x15>
 80484ee:	90                   	nop
 80484ef:	90                   	nop
 80484f0:	89 ec                	mov    %ebp,%esp
 80484f2:	5d                   	pop    %ebp
 80484f3:	c3                   	ret

080484f4 <exec_children>:
 80484f4:	55                   	push   %ebp
 80484f5:	89 e5                	mov    %esp,%ebp
 80484f7:	81 ec b8 00 00 00    	sub    $0xb8,%esp
 80484fd:	89 5d fc             	mov    %ebx,-0x4(%ebp)
 8048500:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048507:	e9 a4 00 00 00       	jmp    80485b0 <exec_children+0xbc>
 804850c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804850f:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048513:	8b 45 08             	mov    0x8(%ebp),%eax
 8048516:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804851a:	c7 44 24 08 ae b3 04 	movl   $0x804b3ae,0x8(%esp)
 8048521:	08 
 8048522:	c7 44 24 04 80 00 00 	movl   $0x80,0x4(%esp)
 8048529:	00 
 804852a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8048530:	89 04 24             	mov    %eax,(%esp)
 8048533:	e8 3a 07 00 00       	call   8048c72 <snprintf>
 8048538:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804853b:	8d 50 01             	lea    0x1(%eax),%edx
 804853e:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8048544:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048548:	8b 45 10             	mov    0x10(%ebp),%eax
 804854b:	89 44 24 08          	mov    %eax,0x8(%esp)
 804854f:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048553:	c7 04 24 b5 b3 04 08 	movl   $0x804b3b5,(%esp)
 804855a:	e8 00 fd ff ff       	call   804825f <msg>
 804855f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048562:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048569:	8b 45 0c             	mov    0xc(%ebp),%eax
 804856c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 804856f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8048575:	89 04 24             	mov    %eax,(%esp)
 8048578:	e8 67 27 00 00       	call   804ace4 <exec>
 804857d:	89 03                	mov    %eax,(%ebx)
 804857f:	8b 03                	mov    (%ebx),%eax
 8048581:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048584:	75 27                	jne    80485ad <exec_children+0xb9>
 8048586:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048589:	8d 50 01             	lea    0x1(%eax),%edx
 804858c:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
 8048592:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048596:	8b 45 10             	mov    0x10(%ebp),%eax
 8048599:	89 44 24 08          	mov    %eax,0x8(%esp)
 804859d:	89 54 24 04          	mov    %edx,0x4(%esp)
 80485a1:	c7 04 24 b5 b3 04 08 	movl   $0x804b3b5,(%esp)
 80485a8:	e8 18 fd ff ff       	call   80482c5 <fail>
 80485ad:	ff 45 f4             	incl   -0xc(%ebp)
 80485b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80485b3:	3b 45 10             	cmp    0x10(%ebp),%eax
 80485b6:	0f 82 50 ff ff ff    	jb     804850c <exec_children+0x18>
 80485bc:	90                   	nop
 80485bd:	90                   	nop
 80485be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80485c1:	89 ec                	mov    %ebp,%esp
 80485c3:	5d                   	pop    %ebp
 80485c4:	c3                   	ret

080485c5 <wait_children>:
 80485c5:	55                   	push   %ebp
 80485c6:	89 e5                	mov    %esp,%ebp
 80485c8:	83 ec 38             	sub    $0x38,%esp
 80485cb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80485d2:	eb 7d                	jmp    8048651 <wait_children+0x8c>
 80485d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80485d7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 80485de:	8b 45 08             	mov    0x8(%ebp),%eax
 80485e1:	01 d0                	add    %edx,%eax
 80485e3:	8b 00                	mov    (%eax),%eax
 80485e5:	89 04 24             	mov    %eax,(%esp)
 80485e8:	e8 11 27 00 00       	call   804acfe <wait>
 80485ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80485f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80485f3:	8d 50 01             	lea    0x1(%eax),%edx
 80485f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80485f9:	89 44 24 10          	mov    %eax,0x10(%esp)
 80485fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048600:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048604:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048607:	89 44 24 08          	mov    %eax,0x8(%esp)
 804860b:	89 54 24 04          	mov    %edx,0x4(%esp)
 804860f:	c7 04 24 d4 b3 04 08 	movl   $0x804b3d4,(%esp)
 8048616:	e8 44 fc ff ff       	call   804825f <msg>
 804861b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804861e:	39 45 f0             	cmp    %eax,-0x10(%ebp)
 8048621:	74 2b                	je     804864e <wait_children+0x89>
 8048623:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048626:	8d 50 01             	lea    0x1(%eax),%edx
 8048629:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804862c:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048630:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048633:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048637:	8b 45 0c             	mov    0xc(%ebp),%eax
 804863a:	89 44 24 08          	mov    %eax,0x8(%esp)
 804863e:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048642:	c7 04 24 d4 b3 04 08 	movl   $0x804b3d4,(%esp)
 8048649:	e8 77 fc ff ff       	call   80482c5 <fail>
 804864e:	ff 45 f4             	incl   -0xc(%ebp)
 8048651:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048654:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048657:	0f 82 77 ff ff ff    	jb     80485d4 <wait_children+0xf>
 804865d:	90                   	nop
 804865e:	90                   	nop
 804865f:	89 ec                	mov    %ebp,%esp
 8048661:	5d                   	pop    %ebp
 8048662:	c3                   	ret

08048663 <check_file_handle>:
 8048663:	55                   	push   %ebp
 8048664:	89 e5                	mov    %esp,%ebp
 8048666:	81 ec 48 02 00 00    	sub    $0x248,%esp
 804866c:	8b 45 10             	mov    0x10(%ebp),%eax
 804866f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048672:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048679:	8b 45 08             	mov    0x8(%ebp),%eax
 804867c:	89 04 24             	mov    %eax,(%esp)
 804867f:	e8 f1 26 00 00       	call   804ad75 <filesize>
 8048684:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048687:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804868a:	3b 45 14             	cmp    0x14(%ebp),%eax
 804868d:	0f 84 c3 00 00 00    	je     8048756 <check_file_handle+0xf3>
 8048693:	8b 45 14             	mov    0x14(%ebp),%eax
 8048696:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804869a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804869d:	89 44 24 08          	mov    %eax,0x8(%esp)
 80486a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80486a8:	c7 04 24 0c b4 04 08 	movl   $0x804b40c,(%esp)
 80486af:	e8 ab fb ff ff       	call   804825f <msg>
 80486b4:	e9 9d 00 00 00       	jmp    8048756 <check_file_handle+0xf3>
 80486b9:	8b 45 14             	mov    0x14(%ebp),%eax
 80486bc:	2b 45 f4             	sub    -0xc(%ebp),%eax
 80486bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80486c2:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
 80486c9:	76 07                	jbe    80486d2 <check_file_handle+0x6f>
 80486cb:	c7 45 f0 00 02 00 00 	movl   $0x200,-0x10(%ebp)
 80486d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80486d5:	89 44 24 08          	mov    %eax,0x8(%esp)
 80486d9:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
 80486df:	89 44 24 04          	mov    %eax,0x4(%esp)
 80486e3:	8b 45 08             	mov    0x8(%ebp),%eax
 80486e6:	89 04 24             	mov    %eax,(%esp)
 80486e9:	e8 a1 26 00 00       	call   804ad8f <read>
 80486ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80486f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80486f4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 80486f7:	74 28                	je     8048721 <check_file_handle+0xbe>
 80486f9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80486fc:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048700:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048703:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048707:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804870a:	89 44 24 08          	mov    %eax,0x8(%esp)
 804870e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048711:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048715:	c7 04 24 3c b4 04 08 	movl   $0x804b43c,(%esp)
 804871c:	e8 a4 fb ff ff       	call   80482c5 <fail>
 8048721:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048724:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048727:	01 c2                	add    %eax,%edx
 8048729:	8b 45 0c             	mov    0xc(%ebp),%eax
 804872c:	89 44 24 10          	mov    %eax,0x10(%esp)
 8048730:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048733:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048737:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804873a:	89 44 24 08          	mov    %eax,0x8(%esp)
 804873e:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048742:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
 8048748:	89 04 24             	mov    %eax,(%esp)
 804874b:	e8 d6 00 00 00       	call   8048826 <compare_bytes>
 8048750:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048753:	01 45 f4             	add    %eax,-0xc(%ebp)
 8048756:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048759:	3b 45 14             	cmp    0x14(%ebp),%eax
 804875c:	0f 82 57 ff ff ff    	jb     80486b9 <check_file_handle+0x56>
 8048762:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048765:	3b 45 14             	cmp    0x14(%ebp),%eax
 8048768:	74 21                	je     804878b <check_file_handle+0x128>
 804876a:	8b 45 14             	mov    0x14(%ebp),%eax
 804876d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048771:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048774:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048778:	8b 45 0c             	mov    0xc(%ebp),%eax
 804877b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804877f:	c7 04 24 0c b4 04 08 	movl   $0x804b40c,(%esp)
 8048786:	e8 3a fb ff ff       	call   80482c5 <fail>
 804878b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804878e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048792:	c7 04 24 71 b4 04 08 	movl   $0x804b471,(%esp)
 8048799:	e8 c1 fa ff ff       	call   804825f <msg>
 804879e:	90                   	nop
 804879f:	89 ec                	mov    %ebp,%esp
 80487a1:	5d                   	pop    %ebp
 80487a2:	c3                   	ret

080487a3 <check_file>:
 80487a3:	55                   	push   %ebp
 80487a4:	89 e5                	mov    %esp,%ebp
 80487a6:	83 ec 28             	sub    $0x28,%esp
 80487a9:	8b 45 08             	mov    0x8(%ebp),%eax
 80487ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 80487b0:	c7 04 24 8b b4 04 08 	movl   $0x804b48b,(%esp)
 80487b7:	e8 a3 fa ff ff       	call   804825f <msg>
 80487bc:	8b 45 08             	mov    0x8(%ebp),%eax
 80487bf:	89 04 24             	mov    %eax,(%esp)
 80487c2:	e8 94 25 00 00       	call   804ad5b <open>
 80487c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80487ca:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
 80487ce:	7f 13                	jg     80487e3 <check_file+0x40>
 80487d0:	8b 45 08             	mov    0x8(%ebp),%eax
 80487d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 80487d7:	c7 04 24 8b b4 04 08 	movl   $0x804b48b,(%esp)
 80487de:	e8 e2 fa ff ff       	call   80482c5 <fail>
 80487e3:	8b 45 10             	mov    0x10(%ebp),%eax
 80487e6:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80487ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487ed:	89 44 24 08          	mov    %eax,0x8(%esp)
 80487f1:	8b 45 08             	mov    0x8(%ebp),%eax
 80487f4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80487f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80487fb:	89 04 24             	mov    %eax,(%esp)
 80487fe:	e8 60 fe ff ff       	call   8048663 <check_file_handle>
 8048803:	8b 45 08             	mov    0x8(%ebp),%eax
 8048806:	89 44 24 04          	mov    %eax,0x4(%esp)
 804880a:	c7 04 24 a6 b4 04 08 	movl   $0x804b4a6,(%esp)
 8048811:	e8 49 fa ff ff       	call   804825f <msg>
 8048816:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048819:	89 04 24             	mov    %eax,(%esp)
 804881c:	e8 eb 25 00 00       	call   804ae0c <close>
 8048821:	90                   	nop
 8048822:	89 ec                	mov    %ebp,%esp
 8048824:	5d                   	pop    %ebp
 8048825:	c3                   	ret

08048826 <compare_bytes>:
 8048826:	55                   	push   %ebp
 8048827:	89 e5                	mov    %esp,%ebp
 8048829:	83 ec 38             	sub    $0x38,%esp
 804882c:	8b 45 08             	mov    0x8(%ebp),%eax
 804882f:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048832:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048835:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8048838:	8b 45 10             	mov    0x10(%ebp),%eax
 804883b:	89 44 24 08          	mov    %eax,0x8(%esp)
 804883f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048842:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048846:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048849:	89 04 24             	mov    %eax,(%esp)
 804884c:	e8 15 17 00 00       	call   8049f66 <memcmp>
 8048851:	85 c0                	test   %eax,%eax
 8048853:	0f 84 5b 01 00 00    	je     80489b4 <compare_bytes+0x18e>
 8048859:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048860:	eb 1d                	jmp    804887f <compare_bytes+0x59>
 8048862:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048865:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048868:	01 d0                	add    %edx,%eax
 804886a:	0f b6 10             	movzbl (%eax),%edx
 804886d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8048870:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048873:	01 c8                	add    %ecx,%eax
 8048875:	0f b6 00             	movzbl (%eax),%eax
 8048878:	38 c2                	cmp    %al,%dl
 804887a:	75 0d                	jne    8048889 <compare_bytes+0x63>
 804887c:	ff 45 f4             	incl   -0xc(%ebp)
 804887f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048882:	3b 45 10             	cmp    0x10(%ebp),%eax
 8048885:	72 db                	jb     8048862 <compare_bytes+0x3c>
 8048887:	eb 01                	jmp    804888a <compare_bytes+0x64>
 8048889:	90                   	nop
 804888a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804888d:	40                   	inc    %eax
 804888e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048891:	eb 1d                	jmp    80488b0 <compare_bytes+0x8a>
 8048893:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048896:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048899:	01 d0                	add    %edx,%eax
 804889b:	0f b6 10             	movzbl (%eax),%edx
 804889e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 80488a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80488a4:	01 c8                	add    %ecx,%eax
 80488a6:	0f b6 00             	movzbl (%eax),%eax
 80488a9:	38 c2                	cmp    %al,%dl
 80488ab:	74 0d                	je     80488ba <compare_bytes+0x94>
 80488ad:	ff 45 f0             	incl   -0x10(%ebp)
 80488b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80488b3:	3b 45 10             	cmp    0x10(%ebp),%eax
 80488b6:	72 db                	jb     8048893 <compare_bytes+0x6d>
 80488b8:	eb 01                	jmp    80488bb <compare_bytes+0x95>
 80488ba:	90                   	nop
 80488bb:	c6 05 04 cb 04 08 00 	movb   $0x0,0x804cb04
 80488c2:	8b 55 14             	mov    0x14(%ebp),%edx
 80488c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80488c8:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 80488cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80488ce:	2b 45 f4             	sub    -0xc(%ebp),%eax
 80488d1:	8b 55 18             	mov    0x18(%ebp),%edx
 80488d4:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80488d8:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80488dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 80488e0:	c7 04 24 b4 b4 04 08 	movl   $0x804b4b4,(%esp)
 80488e7:	e8 73 f9 ff ff       	call   804825f <msg>
 80488ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80488ef:	2b 45 f4             	sub    -0xc(%ebp),%eax
 80488f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80488f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80488f8:	2b 45 f4             	sub    -0xc(%ebp),%eax
 80488fb:	83 f8 40             	cmp    $0x40,%eax
 80488fe:	76 1a                	jbe    804891a <compare_bytes+0xf4>
 8048900:	c7 45 ec 40 00 00 00 	movl   $0x40,-0x14(%ebp)
 8048907:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804890a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804890e:	c7 04 24 f8 b4 04 08 	movl   $0x804b4f8,(%esp)
 8048915:	e8 45 f9 ff ff       	call   804825f <msg>
 804891a:	c7 04 24 1b b5 04 08 	movl   $0x804b51b,(%esp)
 8048921:	e8 39 f9 ff ff       	call   804825f <msg>
 8048926:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8048929:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804892c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 804892f:	8b 55 14             	mov    0x14(%ebp),%edx
 8048932:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048935:	01 c2                	add    %eax,%edx
 8048937:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 804893e:	00 
 804893f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048942:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048946:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 804894a:	89 14 24             	mov    %edx,(%esp)
 804894d:	e8 12 12 00 00       	call   8049b64 <hex_dump>
 8048952:	c7 04 24 2f b5 04 08 	movl   $0x804b52f,(%esp)
 8048959:	e8 01 f9 ff ff       	call   804825f <msg>
 804895e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8048961:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048964:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048967:	8b 55 14             	mov    0x14(%ebp),%edx
 804896a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804896d:	01 c2                	add    %eax,%edx
 804896f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8048976:	00 
 8048977:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804897a:	89 44 24 08          	mov    %eax,0x8(%esp)
 804897e:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048982:	89 14 24             	mov    %edx,(%esp)
 8048985:	e8 da 11 00 00       	call   8049b64 <hex_dump>
 804898a:	8b 55 14             	mov    0x14(%ebp),%edx
 804898d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048990:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 8048993:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048996:	2b 45 f4             	sub    -0xc(%ebp),%eax
 8048999:	8b 55 18             	mov    0x18(%ebp),%edx
 804899c:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80489a0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80489a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80489a8:	c7 04 24 40 b5 04 08 	movl   $0x804b540,(%esp)
 80489af:	e8 11 f9 ff ff       	call   80482c5 <fail>
 80489b4:	90                   	nop
 80489b5:	89 ec                	mov    %ebp,%esp
 80489b7:	5d                   	pop    %ebp
 80489b8:	c3                   	ret

080489b9 <_start>:
 80489b9:	55                   	push   %ebp
 80489ba:	89 e5                	mov    %esp,%ebp
 80489bc:	83 ec 18             	sub    $0x18,%esp
 80489bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 80489c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 80489c6:	8b 45 08             	mov    0x8(%ebp),%eax
 80489c9:	89 04 24             	mov    %eax,(%esp)
 80489cc:	e8 c3 f6 ff ff       	call   8048094 <main>
 80489d1:	89 04 24             	mov    %eax,(%esp)
 80489d4:	e8 d4 22 00 00       	call   804acad <exit>

080489d9 <swap_byte>:
 80489d9:	55                   	push   %ebp
 80489da:	89 e5                	mov    %esp,%ebp
 80489dc:	83 ec 10             	sub    $0x10,%esp
 80489df:	8b 45 08             	mov    0x8(%ebp),%eax
 80489e2:	0f b6 00             	movzbl (%eax),%eax
 80489e5:	88 45 ff             	mov    %al,-0x1(%ebp)
 80489e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80489eb:	0f b6 10             	movzbl (%eax),%edx
 80489ee:	8b 45 08             	mov    0x8(%ebp),%eax
 80489f1:	88 10                	mov    %dl,(%eax)
 80489f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80489f6:	0f b6 55 ff          	movzbl -0x1(%ebp),%edx
 80489fa:	88 10                	mov    %dl,(%eax)
 80489fc:	90                   	nop
 80489fd:	89 ec                	mov    %ebp,%esp
 80489ff:	5d                   	pop    %ebp
 8048a00:	c3                   	ret

08048a01 <random_init>:
 8048a01:	55                   	push   %ebp
 8048a02:	89 e5                	mov    %esp,%ebp
 8048a04:	83 ec 18             	sub    $0x18,%esp
 8048a07:	8d 45 08             	lea    0x8(%ebp),%eax
 8048a0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048a0d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048a14:	eb 12                	jmp    8048a28 <random_init+0x27>
 8048a16:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048a19:	88 c2                	mov    %al,%dl
 8048a1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048a1e:	05 20 cf 04 08       	add    $0x804cf20,%eax
 8048a23:	88 10                	mov    %dl,(%eax)
 8048a25:	ff 45 fc             	incl   -0x4(%ebp)
 8048a28:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
 8048a2f:	7e e5                	jle    8048a16 <random_init+0x15>
 8048a31:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
 8048a35:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8048a3c:	eb 41                	jmp    8048a7f <random_init+0x7e>
 8048a3e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048a41:	05 20 cf 04 08       	add    $0x804cf20,%eax
 8048a46:	0f b6 10             	movzbl (%eax),%edx
 8048a49:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048a4c:	83 e0 03             	and    $0x3,%eax
 8048a4f:	89 c1                	mov    %eax,%ecx
 8048a51:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a54:	01 c8                	add    %ecx,%eax
 8048a56:	0f b6 00             	movzbl (%eax),%eax
 8048a59:	00 d0                	add    %dl,%al
 8048a5b:	00 45 fb             	add    %al,-0x5(%ebp)
 8048a5e:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
 8048a62:	8d 90 20 cf 04 08    	lea    0x804cf20(%eax),%edx
 8048a68:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048a6b:	05 20 cf 04 08       	add    $0x804cf20,%eax
 8048a70:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048a74:	89 04 24             	mov    %eax,(%esp)
 8048a77:	e8 5d ff ff ff       	call   80489d9 <swap_byte>
 8048a7c:	ff 45 fc             	incl   -0x4(%ebp)
 8048a7f:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
 8048a86:	7e b6                	jle    8048a3e <random_init+0x3d>
 8048a88:	c6 05 21 d0 04 08 00 	movb   $0x0,0x804d021
 8048a8f:	0f b6 05 21 d0 04 08 	movzbl 0x804d021,%eax
 8048a96:	a2 20 d0 04 08       	mov    %al,0x804d020
 8048a9b:	c6 05 22 d0 04 08 01 	movb   $0x1,0x804d022
 8048aa2:	90                   	nop
 8048aa3:	89 ec                	mov    %ebp,%esp
 8048aa5:	5d                   	pop    %ebp
 8048aa6:	c3                   	ret

08048aa7 <random_bytes>:
 8048aa7:	55                   	push   %ebp
 8048aa8:	89 e5                	mov    %esp,%ebp
 8048aaa:	83 ec 18             	sub    $0x18,%esp
 8048aad:	0f b6 05 22 d0 04 08 	movzbl 0x804d022,%eax
 8048ab4:	34 01                	xor    $0x1,%al
 8048ab6:	84 c0                	test   %al,%al
 8048ab8:	74 0c                	je     8048ac6 <random_bytes+0x1f>
 8048aba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048ac1:	e8 3b ff ff ff       	call   8048a01 <random_init>
 8048ac6:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ac9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048acc:	e9 92 00 00 00       	jmp    8048b63 <random_bytes+0xbc>
 8048ad1:	0f b6 05 20 d0 04 08 	movzbl 0x804d020,%eax
 8048ad8:	fe c0                	inc    %al
 8048ada:	a2 20 d0 04 08       	mov    %al,0x804d020
 8048adf:	0f b6 05 20 d0 04 08 	movzbl 0x804d020,%eax
 8048ae6:	0f b6 c0             	movzbl %al,%eax
 8048ae9:	0f b6 90 20 cf 04 08 	movzbl 0x804cf20(%eax),%edx
 8048af0:	0f b6 05 21 d0 04 08 	movzbl 0x804d021,%eax
 8048af7:	00 d0                	add    %dl,%al
 8048af9:	a2 21 d0 04 08       	mov    %al,0x804d021
 8048afe:	0f b6 05 21 d0 04 08 	movzbl 0x804d021,%eax
 8048b05:	0f b6 c0             	movzbl %al,%eax
 8048b08:	8d 90 20 cf 04 08    	lea    0x804cf20(%eax),%edx
 8048b0e:	0f b6 05 20 d0 04 08 	movzbl 0x804d020,%eax
 8048b15:	0f b6 c0             	movzbl %al,%eax
 8048b18:	05 20 cf 04 08       	add    $0x804cf20,%eax
 8048b1d:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048b21:	89 04 24             	mov    %eax,(%esp)
 8048b24:	e8 b0 fe ff ff       	call   80489d9 <swap_byte>
 8048b29:	0f b6 05 20 d0 04 08 	movzbl 0x804d020,%eax
 8048b30:	0f b6 c0             	movzbl %al,%eax
 8048b33:	0f b6 90 20 cf 04 08 	movzbl 0x804cf20(%eax),%edx
 8048b3a:	0f b6 05 21 d0 04 08 	movzbl 0x804d021,%eax
 8048b41:	0f b6 c0             	movzbl %al,%eax
 8048b44:	0f b6 80 20 cf 04 08 	movzbl 0x804cf20(%eax),%eax
 8048b4b:	00 d0                	add    %dl,%al
 8048b4d:	88 45 fb             	mov    %al,-0x5(%ebp)
 8048b50:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
 8048b54:	0f b6 90 20 cf 04 08 	movzbl 0x804cf20(%eax),%edx
 8048b5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048b5e:	88 10                	mov    %dl,(%eax)
 8048b60:	ff 45 fc             	incl   -0x4(%ebp)
 8048b63:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048b66:	8d 50 ff             	lea    -0x1(%eax),%edx
 8048b69:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048b6c:	85 c0                	test   %eax,%eax
 8048b6e:	0f 85 5d ff ff ff    	jne    8048ad1 <random_bytes+0x2a>
 8048b74:	90                   	nop
 8048b75:	90                   	nop
 8048b76:	89 ec                	mov    %ebp,%esp
 8048b78:	5d                   	pop    %ebp
 8048b79:	c3                   	ret

08048b7a <random_ulong>:
 8048b7a:	55                   	push   %ebp
 8048b7b:	89 e5                	mov    %esp,%ebp
 8048b7d:	83 ec 18             	sub    $0x18,%esp
 8048b80:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
 8048b87:	00 
 8048b88:	8d 45 fc             	lea    -0x4(%ebp),%eax
 8048b8b:	89 04 24             	mov    %eax,(%esp)
 8048b8e:	e8 14 ff ff ff       	call   8048aa7 <random_bytes>
 8048b93:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048b96:	89 ec                	mov    %ebp,%esp
 8048b98:	5d                   	pop    %ebp
 8048b99:	c3                   	ret

08048b9a <isdigit>:
 8048b9a:	55                   	push   %ebp
 8048b9b:	89 e5                	mov    %esp,%ebp
 8048b9d:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
 8048ba1:	7e 0d                	jle    8048bb0 <isdigit+0x16>
 8048ba3:	83 7d 08 39          	cmpl   $0x39,0x8(%ebp)
 8048ba7:	7f 07                	jg     8048bb0 <isdigit+0x16>
 8048ba9:	b8 01 00 00 00       	mov    $0x1,%eax
 8048bae:	eb 05                	jmp    8048bb5 <isdigit+0x1b>
 8048bb0:	b8 00 00 00 00       	mov    $0x0,%eax
 8048bb5:	5d                   	pop    %ebp
 8048bb6:	c3                   	ret

08048bb7 <isprint>:
 8048bb7:	55                   	push   %ebp
 8048bb8:	89 e5                	mov    %esp,%ebp
 8048bba:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
 8048bbe:	7e 0d                	jle    8048bcd <isprint+0x16>
 8048bc0:	83 7d 08 7e          	cmpl   $0x7e,0x8(%ebp)
 8048bc4:	7f 07                	jg     8048bcd <isprint+0x16>
 8048bc6:	b8 01 00 00 00       	mov    $0x1,%eax
 8048bcb:	eb 05                	jmp    8048bd2 <isprint+0x1b>
 8048bcd:	b8 00 00 00 00       	mov    $0x0,%eax
 8048bd2:	5d                   	pop    %ebp
 8048bd3:	c3                   	ret

08048bd4 <vsnprintf>:
 8048bd4:	55                   	push   %ebp
 8048bd5:	89 e5                	mov    %esp,%ebp
 8048bd7:	83 ec 28             	sub    $0x28,%esp
 8048bda:	8b 45 08             	mov    0x8(%ebp),%eax
 8048bdd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048be0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048be7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048beb:	74 06                	je     8048bf3 <vsnprintf+0x1f>
 8048bed:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048bf0:	48                   	dec    %eax
 8048bf1:	eb 05                	jmp    8048bf8 <vsnprintf+0x24>
 8048bf3:	b8 00 00 00 00       	mov    $0x0,%eax
 8048bf8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048bfb:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8048bfe:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048c02:	c7 44 24 08 2f 8c 04 	movl   $0x8048c2f,0x8(%esp)
 8048c09:	08 
 8048c0a:	8b 45 14             	mov    0x14(%ebp),%eax
 8048c0d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048c11:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c14:	89 04 24             	mov    %eax,(%esp)
 8048c17:	e8 b4 00 00 00       	call   8048cd0 <__vprintf>
 8048c1c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048c20:	74 06                	je     8048c28 <vsnprintf+0x54>
 8048c22:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048c25:	c6 00 00             	movb   $0x0,(%eax)
 8048c28:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048c2b:	89 ec                	mov    %ebp,%esp
 8048c2d:	5d                   	pop    %ebp
 8048c2e:	c3                   	ret

08048c2f <vsnprintf_helper>:
 8048c2f:	55                   	push   %ebp
 8048c30:	89 e5                	mov    %esp,%ebp
 8048c32:	83 ec 14             	sub    $0x14,%esp
 8048c35:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c38:	88 45 ec             	mov    %al,-0x14(%ebp)
 8048c3b:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048c3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048c41:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048c44:	8b 40 04             	mov    0x4(%eax),%eax
 8048c47:	8d 48 01             	lea    0x1(%eax),%ecx
 8048c4a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048c4d:	89 4a 04             	mov    %ecx,0x4(%edx)
 8048c50:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048c53:	8b 52 08             	mov    0x8(%edx),%edx
 8048c56:	39 d0                	cmp    %edx,%eax
 8048c58:	7d 13                	jge    8048c6d <vsnprintf_helper+0x3e>
 8048c5a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048c5d:	8b 00                	mov    (%eax),%eax
 8048c5f:	8d 48 01             	lea    0x1(%eax),%ecx
 8048c62:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048c65:	89 0a                	mov    %ecx,(%edx)
 8048c67:	0f b6 55 ec          	movzbl -0x14(%ebp),%edx
 8048c6b:	88 10                	mov    %dl,(%eax)
 8048c6d:	90                   	nop
 8048c6e:	89 ec                	mov    %ebp,%esp
 8048c70:	5d                   	pop    %ebp
 8048c71:	c3                   	ret

08048c72 <snprintf>:
 8048c72:	55                   	push   %ebp
 8048c73:	89 e5                	mov    %esp,%ebp
 8048c75:	83 ec 28             	sub    $0x28,%esp
 8048c78:	8d 45 14             	lea    0x14(%ebp),%eax
 8048c7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048c7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048c81:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048c85:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c88:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048c8c:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048c8f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048c93:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c96:	89 04 24             	mov    %eax,(%esp)
 8048c99:	e8 36 ff ff ff       	call   8048bd4 <vsnprintf>
 8048c9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048ca1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ca4:	89 ec                	mov    %ebp,%esp
 8048ca6:	5d                   	pop    %ebp
 8048ca7:	c3                   	ret

08048ca8 <printf>:
 8048ca8:	55                   	push   %ebp
 8048ca9:	89 e5                	mov    %esp,%ebp
 8048cab:	83 ec 28             	sub    $0x28,%esp
 8048cae:	8d 45 0c             	lea    0xc(%ebp),%eax
 8048cb1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048cb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048cb7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048cbb:	8b 45 08             	mov    0x8(%ebp),%eax
 8048cbe:	89 04 24             	mov    %eax,(%esp)
 8048cc1:	e8 56 24 00 00       	call   804b11c <vprintf>
 8048cc6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048cc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ccc:	89 ec                	mov    %ebp,%esp
 8048cce:	5d                   	pop    %ebp
 8048ccf:	c3                   	ret

08048cd0 <__vprintf>:
 8048cd0:	55                   	push   %ebp
 8048cd1:	89 e5                	mov    %esp,%ebp
 8048cd3:	57                   	push   %edi
 8048cd4:	56                   	push   %esi
 8048cd5:	53                   	push   %ebx
 8048cd6:	81 ec ac 00 00 00    	sub    $0xac,%esp
 8048cdc:	e9 26 07 00 00       	jmp    8049407 <__vprintf+0x737>
 8048ce1:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ce4:	0f b6 00             	movzbl (%eax),%eax
 8048ce7:	3c 25                	cmp    $0x25,%al
 8048ce9:	74 1d                	je     8048d08 <__vprintf+0x38>
 8048ceb:	8b 45 08             	mov    0x8(%ebp),%eax
 8048cee:	0f b6 00             	movzbl (%eax),%eax
 8048cf1:	0f be d0             	movsbl %al,%edx
 8048cf4:	8b 45 14             	mov    0x14(%ebp),%eax
 8048cf7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048cfb:	89 14 24             	mov    %edx,(%esp)
 8048cfe:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d01:	ff d0                	call   *%eax
 8048d03:	e9 fc 06 00 00       	jmp    8049404 <__vprintf+0x734>
 8048d08:	ff 45 08             	incl   0x8(%ebp)
 8048d0b:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d0e:	0f b6 00             	movzbl (%eax),%eax
 8048d11:	3c 25                	cmp    $0x25,%al
 8048d13:	75 18                	jne    8048d2d <__vprintf+0x5d>
 8048d15:	8b 45 14             	mov    0x14(%ebp),%eax
 8048d18:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048d1c:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
 8048d23:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d26:	ff d0                	call   *%eax
 8048d28:	e9 d7 06 00 00       	jmp    8049404 <__vprintf+0x734>
 8048d2d:	8d 45 0c             	lea    0xc(%ebp),%eax
 8048d30:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048d34:	8d 45 98             	lea    -0x68(%ebp),%eax
 8048d37:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048d3b:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d3e:	89 04 24             	mov    %eax,(%esp)
 8048d41:	e8 dc 06 00 00       	call   8049422 <parse_conversion>
 8048d46:	89 45 08             	mov    %eax,0x8(%ebp)
 8048d49:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d4c:	0f b6 00             	movzbl (%eax),%eax
 8048d4f:	0f be c0             	movsbl %al,%eax
 8048d52:	83 f8 78             	cmp    $0x78,%eax
 8048d55:	0f 8f 81 06 00 00    	jg     80493dc <__vprintf+0x70c>
 8048d5b:	83 f8 6f             	cmp    $0x6f,%eax
 8048d5e:	7d 49                	jge    8048da9 <__vprintf+0xd9>
 8048d60:	83 f8 6e             	cmp    $0x6e,%eax
 8048d63:	0f 8f 73 06 00 00    	jg     80493dc <__vprintf+0x70c>
 8048d69:	83 f8 64             	cmp    $0x64,%eax
 8048d6c:	7d 50                	jge    8048dbe <__vprintf+0xee>
 8048d6e:	83 f8 63             	cmp    $0x63,%eax
 8048d71:	0f 84 03 04 00 00    	je     804917a <__vprintf+0x4aa>
 8048d77:	83 f8 63             	cmp    $0x63,%eax
 8048d7a:	0f 8f 5c 06 00 00    	jg     80493dc <__vprintf+0x70c>
 8048d80:	83 f8 58             	cmp    $0x58,%eax
 8048d83:	0f 84 14 02 00 00    	je     8048f9d <__vprintf+0x2cd>
 8048d89:	83 f8 58             	cmp    $0x58,%eax
 8048d8c:	0f 8f 4a 06 00 00    	jg     80493dc <__vprintf+0x70c>
 8048d92:	83 f8 45             	cmp    $0x45,%eax
 8048d95:	0f 84 18 06 00 00    	je     80493b3 <__vprintf+0x6e3>
 8048d9b:	83 f8 47             	cmp    $0x47,%eax
 8048d9e:	0f 84 0f 06 00 00    	je     80493b3 <__vprintf+0x6e3>
 8048da4:	e9 33 06 00 00       	jmp    80493dc <__vprintf+0x70c>
 8048da9:	83 e8 6f             	sub    $0x6f,%eax
 8048dac:	83 f8 09             	cmp    $0x9,%eax
 8048daf:	0f 87 27 06 00 00    	ja     80493dc <__vprintf+0x70c>
 8048db5:	8b 04 85 e8 b6 04 08 	mov    0x804b6e8(,%eax,4),%eax
 8048dbc:	ff e0                	jmp    *%eax
 8048dbe:	8d 50 9c             	lea    -0x64(%eax),%edx
 8048dc1:	b8 01 00 00 00       	mov    $0x1,%eax
 8048dc6:	88 d1                	mov    %dl,%cl
 8048dc8:	d3 e0                	shl    %cl,%eax
 8048dca:	89 c2                	mov    %eax,%edx
 8048dcc:	89 d0                	mov    %edx,%eax
 8048dce:	25 0a 04 00 00       	and    $0x40a,%eax
 8048dd3:	85 c0                	test   %eax,%eax
 8048dd5:	0f 95 c0             	setne  %al
 8048dd8:	84 c0                	test   %al,%al
 8048dda:	0f 85 d3 05 00 00    	jne    80493b3 <__vprintf+0x6e3>
 8048de0:	89 d0                	mov    %edx,%eax
 8048de2:	83 e0 21             	and    $0x21,%eax
 8048de5:	85 c0                	test   %eax,%eax
 8048de7:	0f 95 c0             	setne  %al
 8048dea:	84 c0                	test   %al,%al
 8048dec:	75 17                	jne    8048e05 <__vprintf+0x135>
 8048dee:	89 d0                	mov    %edx,%eax
 8048df0:	83 e0 04             	and    $0x4,%eax
 8048df3:	85 c0                	test   %eax,%eax
 8048df5:	0f 95 c0             	setne  %al
 8048df8:	84 c0                	test   %al,%al
 8048dfa:	0f 85 6a 04 00 00    	jne    804926a <__vprintf+0x59a>
 8048e00:	e9 d7 05 00 00       	jmp    80493dc <__vprintf+0x70c>
 8048e05:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 8048e08:	83 f8 08             	cmp    $0x8,%eax
 8048e0b:	0f 87 d5 00 00 00    	ja     8048ee6 <__vprintf+0x216>
 8048e11:	8b 04 85 10 b7 04 08 	mov    0x804b710(,%eax,4),%eax
 8048e18:	ff e0                	jmp    *%eax
 8048e1a:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048e1d:	8d 42 04             	lea    0x4(%edx),%eax
 8048e20:	89 45 0c             	mov    %eax,0xc(%ebp)
 8048e23:	8b 02                	mov    (%edx),%eax
 8048e25:	0f be c0             	movsbl %al,%eax
 8048e28:	99                   	cltd
 8048e29:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048e2c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048e2f:	e9 d7 00 00 00       	jmp    8048f0b <__vprintf+0x23b>
 8048e34:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048e37:	8d 42 04             	lea    0x4(%edx),%eax
 8048e3a:	89 45 0c             	mov    %eax,0xc(%ebp)
 8048e3d:	8b 02                	mov    (%edx),%eax
 8048e3f:	98                   	cwtl
 8048e40:	99                   	cltd
 8048e41:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048e44:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048e47:	e9 bf 00 00 00       	jmp    8048f0b <__vprintf+0x23b>
 8048e4c:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048e4f:	8d 42 04             	lea    0x4(%edx),%eax
 8048e52:	89 45 0c             	mov    %eax,0xc(%ebp)
 8048e55:	8b 02                	mov    (%edx),%eax
 8048e57:	99                   	cltd
 8048e58:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048e5b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048e5e:	e9 a8 00 00 00       	jmp    8048f0b <__vprintf+0x23b>
 8048e63:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048e66:	8d 42 08             	lea    0x8(%edx),%eax
 8048e69:	89 45 0c             	mov    %eax,0xc(%ebp)
 8048e6c:	8b 02                	mov    (%edx),%eax
 8048e6e:	8b 52 04             	mov    0x4(%edx),%edx
 8048e71:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048e74:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048e77:	e9 8f 00 00 00       	jmp    8048f0b <__vprintf+0x23b>
 8048e7c:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048e7f:	8d 42 04             	lea    0x4(%edx),%eax
 8048e82:	89 45 0c             	mov    %eax,0xc(%ebp)
 8048e85:	8b 02                	mov    (%edx),%eax
 8048e87:	99                   	cltd
 8048e88:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048e8b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048e8e:	eb 7b                	jmp    8048f0b <__vprintf+0x23b>
 8048e90:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048e93:	8d 42 08             	lea    0x8(%edx),%eax
 8048e96:	89 45 0c             	mov    %eax,0xc(%ebp)
 8048e99:	8b 02                	mov    (%edx),%eax
 8048e9b:	8b 52 04             	mov    0x4(%edx),%edx
 8048e9e:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048ea1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048ea4:	eb 65                	jmp    8048f0b <__vprintf+0x23b>
 8048ea6:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048ea9:	8d 42 04             	lea    0x4(%edx),%eax
 8048eac:	89 45 0c             	mov    %eax,0xc(%ebp)
 8048eaf:	8b 02                	mov    (%edx),%eax
 8048eb1:	99                   	cltd
 8048eb2:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048eb5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048eb8:	eb 51                	jmp    8048f0b <__vprintf+0x23b>
 8048eba:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048ebd:	8d 42 04             	lea    0x4(%edx),%eax
 8048ec0:	89 45 0c             	mov    %eax,0xc(%ebp)
 8048ec3:	8b 02                	mov    (%edx),%eax
 8048ec5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048ec8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 8048ecf:	ba ff ff ff 7f       	mov    $0x7fffffff,%edx
 8048ed4:	b8 00 00 00 00       	mov    $0x0,%eax
 8048ed9:	3b 55 e0             	cmp    -0x20(%ebp),%edx
 8048edc:	1b 45 e4             	sbb    -0x1c(%ebp),%eax
 8048edf:	7d 29                	jge    8048f0a <__vprintf+0x23a>
 8048ee1:	ff 4d e4             	decl   -0x1c(%ebp)
 8048ee4:	eb 24                	jmp    8048f0a <__vprintf+0x23a>
 8048ee6:	c7 44 24 0c 80 b6 04 	movl   $0x804b680,0xc(%esp)
 8048eed:	08 
 8048eee:	c7 44 24 08 0c b8 04 	movl   $0x804b80c,0x8(%esp)
 8048ef5:	08 
 8048ef6:	c7 44 24 04 c3 00 00 	movl   $0xc3,0x4(%esp)
 8048efd:	00 
 8048efe:	c7 04 24 a2 b6 04 08 	movl   $0x804b6a2,(%esp)
 8048f05:	e8 f9 1c 00 00       	call   804ac03 <debug_panic>
 8048f0a:	90                   	nop
 8048f0b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048f0e:	c1 e8 1f             	shr    $0x1f,%eax
 8048f11:	0f b6 f0             	movzbl %al,%esi
 8048f14:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048f17:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8048f1a:	89 c3                	mov    %eax,%ebx
 8048f1c:	f7 db                	neg    %ebx
 8048f1e:	89 9d 78 ff ff ff    	mov    %ebx,-0x88(%ebp)
 8048f24:	89 d3                	mov    %edx,%ebx
 8048f26:	83 d3 00             	adc    $0x0,%ebx
 8048f29:	89 9d 7c ff ff ff    	mov    %ebx,-0x84(%ebp)
 8048f2f:	f7 9d 7c ff ff ff    	negl   -0x84(%ebp)
 8048f35:	8b 8d 78 ff ff ff    	mov    -0x88(%ebp),%ecx
 8048f3b:	8b 9d 7c ff ff ff    	mov    -0x84(%ebp),%ebx
 8048f41:	89 cf                	mov    %ecx,%edi
 8048f43:	0f 48 f8             	cmovs  %eax,%edi
 8048f46:	89 bd 70 ff ff ff    	mov    %edi,-0x90(%ebp)
 8048f4c:	89 d0                	mov    %edx,%eax
 8048f4e:	0f 49 c3             	cmovns %ebx,%eax
 8048f51:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 8048f57:	8b 8d 70 ff ff ff    	mov    -0x90(%ebp),%ecx
 8048f5d:	8b 9d 74 ff ff ff    	mov    -0x8c(%ebp),%ebx
 8048f63:	8b 45 14             	mov    0x14(%ebp),%eax
 8048f66:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 8048f6a:	8b 45 10             	mov    0x10(%ebp),%eax
 8048f6d:	89 44 24 18          	mov    %eax,0x18(%esp)
 8048f71:	8d 45 98             	lea    -0x68(%ebp),%eax
 8048f74:	89 44 24 14          	mov    %eax,0x14(%esp)
 8048f78:	c7 44 24 10 b4 b5 04 	movl   $0x804b5b4,0x10(%esp)
 8048f7f:	08 
 8048f80:	89 74 24 0c          	mov    %esi,0xc(%esp)
 8048f84:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8048f8b:	00 
 8048f8c:	89 0c 24             	mov    %ecx,(%esp)
 8048f8f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8048f93:	e8 4c 07 00 00       	call   80496e4 <format_integer>
 8048f98:	e9 67 04 00 00       	jmp    8049404 <__vprintf+0x734>
 8048f9d:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 8048fa0:	83 f8 08             	cmp    $0x8,%eax
 8048fa3:	0f 87 fb 00 00 00    	ja     80490a4 <__vprintf+0x3d4>
 8048fa9:	8b 04 85 34 b7 04 08 	mov    0x804b734(,%eax,4),%eax
 8048fb0:	ff e0                	jmp    *%eax
 8048fb2:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048fb5:	8d 42 04             	lea    0x4(%edx),%eax
 8048fb8:	89 45 0c             	mov    %eax,0xc(%ebp)
 8048fbb:	8b 02                	mov    (%edx),%eax
 8048fbd:	0f b6 c0             	movzbl %al,%eax
 8048fc0:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8048fc3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8048fca:	e9 f9 00 00 00       	jmp    80490c8 <__vprintf+0x3f8>
 8048fcf:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048fd2:	8d 42 04             	lea    0x4(%edx),%eax
 8048fd5:	89 45 0c             	mov    %eax,0xc(%ebp)
 8048fd8:	8b 02                	mov    (%edx),%eax
 8048fda:	0f b7 c0             	movzwl %ax,%eax
 8048fdd:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8048fe0:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8048fe7:	e9 dc 00 00 00       	jmp    80490c8 <__vprintf+0x3f8>
 8048fec:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048fef:	8d 42 04             	lea    0x4(%edx),%eax
 8048ff2:	89 45 0c             	mov    %eax,0xc(%ebp)
 8048ff5:	8b 02                	mov    (%edx),%eax
 8048ff7:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8048ffa:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8049001:	e9 c2 00 00 00       	jmp    80490c8 <__vprintf+0x3f8>
 8049006:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049009:	8d 42 08             	lea    0x8(%edx),%eax
 804900c:	89 45 0c             	mov    %eax,0xc(%ebp)
 804900f:	8b 02                	mov    (%edx),%eax
 8049011:	8b 52 04             	mov    0x4(%edx),%edx
 8049014:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8049017:	89 55 dc             	mov    %edx,-0x24(%ebp)
 804901a:	e9 a9 00 00 00       	jmp    80490c8 <__vprintf+0x3f8>
 804901f:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049022:	8d 42 04             	lea    0x4(%edx),%eax
 8049025:	89 45 0c             	mov    %eax,0xc(%ebp)
 8049028:	8b 02                	mov    (%edx),%eax
 804902a:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804902d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8049034:	e9 8f 00 00 00       	jmp    80490c8 <__vprintf+0x3f8>
 8049039:	8b 55 0c             	mov    0xc(%ebp),%edx
 804903c:	8d 42 08             	lea    0x8(%edx),%eax
 804903f:	89 45 0c             	mov    %eax,0xc(%ebp)
 8049042:	8b 02                	mov    (%edx),%eax
 8049044:	8b 52 04             	mov    0x4(%edx),%edx
 8049047:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804904a:	89 55 dc             	mov    %edx,-0x24(%ebp)
 804904d:	eb 79                	jmp    80490c8 <__vprintf+0x3f8>
 804904f:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049052:	8d 42 04             	lea    0x4(%edx),%eax
 8049055:	89 45 0c             	mov    %eax,0xc(%ebp)
 8049058:	8b 02                	mov    (%edx),%eax
 804905a:	99                   	cltd
 804905b:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804905e:	89 55 dc             	mov    %edx,-0x24(%ebp)
 8049061:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8049064:	83 e0 ff             	and    $0xffffffff,%eax
 8049067:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
 804906d:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8049070:	83 e0 00             	and    $0x0,%eax
 8049073:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
 8049079:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
 804907f:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
 8049085:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8049088:	89 55 dc             	mov    %edx,-0x24(%ebp)
 804908b:	eb 3b                	jmp    80490c8 <__vprintf+0x3f8>
 804908d:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049090:	8d 42 04             	lea    0x4(%edx),%eax
 8049093:	89 45 0c             	mov    %eax,0xc(%ebp)
 8049096:	8b 02                	mov    (%edx),%eax
 8049098:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804909b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 80490a2:	eb 24                	jmp    80490c8 <__vprintf+0x3f8>
 80490a4:	c7 44 24 0c 80 b6 04 	movl   $0x804b680,0xc(%esp)
 80490ab:	08 
 80490ac:	c7 44 24 08 0c b8 04 	movl   $0x804b80c,0x8(%esp)
 80490b3:	08 
 80490b4:	c7 44 24 04 ee 00 00 	movl   $0xee,0x4(%esp)
 80490bb:	00 
 80490bc:	c7 04 24 a2 b6 04 08 	movl   $0x804b6a2,(%esp)
 80490c3:	e8 3b 1b 00 00       	call   804ac03 <debug_panic>
 80490c8:	8b 45 08             	mov    0x8(%ebp),%eax
 80490cb:	0f b6 00             	movzbl (%eax),%eax
 80490ce:	0f be c0             	movsbl %al,%eax
 80490d1:	83 f8 78             	cmp    $0x78,%eax
 80490d4:	74 2b                	je     8049101 <__vprintf+0x431>
 80490d6:	83 f8 78             	cmp    $0x78,%eax
 80490d9:	7f 38                	jg     8049113 <__vprintf+0x443>
 80490db:	83 f8 75             	cmp    $0x75,%eax
 80490de:	74 18                	je     80490f8 <__vprintf+0x428>
 80490e0:	83 f8 75             	cmp    $0x75,%eax
 80490e3:	7f 2e                	jg     8049113 <__vprintf+0x443>
 80490e5:	83 f8 58             	cmp    $0x58,%eax
 80490e8:	74 20                	je     804910a <__vprintf+0x43a>
 80490ea:	83 f8 6f             	cmp    $0x6f,%eax
 80490ed:	75 24                	jne    8049113 <__vprintf+0x443>
 80490ef:	c7 45 d4 d0 b5 04 08 	movl   $0x804b5d0,-0x2c(%ebp)
 80490f6:	eb 3f                	jmp    8049137 <__vprintf+0x467>
 80490f8:	c7 45 d4 b4 b5 04 08 	movl   $0x804b5b4,-0x2c(%ebp)
 80490ff:	eb 36                	jmp    8049137 <__vprintf+0x467>
 8049101:	c7 45 d4 f4 b5 04 08 	movl   $0x804b5f4,-0x2c(%ebp)
 8049108:	eb 2d                	jmp    8049137 <__vprintf+0x467>
 804910a:	c7 45 d4 18 b6 04 08 	movl   $0x804b618,-0x2c(%ebp)
 8049111:	eb 24                	jmp    8049137 <__vprintf+0x467>
 8049113:	c7 44 24 0c 80 b6 04 	movl   $0x804b680,0xc(%esp)
 804911a:	08 
 804911b:	c7 44 24 08 0c b8 04 	movl   $0x804b80c,0x8(%esp)
 8049122:	08 
 8049123:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
 804912a:	00 
 804912b:	c7 04 24 a2 b6 04 08 	movl   $0x804b6a2,(%esp)
 8049132:	e8 cc 1a 00 00       	call   804ac03 <debug_panic>
 8049137:	8b 45 14             	mov    0x14(%ebp),%eax
 804913a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 804913e:	8b 45 10             	mov    0x10(%ebp),%eax
 8049141:	89 44 24 18          	mov    %eax,0x18(%esp)
 8049145:	8d 45 98             	lea    -0x68(%ebp),%eax
 8049148:	89 44 24 14          	mov    %eax,0x14(%esp)
 804914c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804914f:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049153:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804915a:	00 
 804915b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8049162:	00 
 8049163:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8049166:	8b 55 dc             	mov    -0x24(%ebp),%edx
 8049169:	89 04 24             	mov    %eax,(%esp)
 804916c:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049170:	e8 6f 05 00 00       	call   80496e4 <format_integer>
 8049175:	e9 8a 02 00 00       	jmp    8049404 <__vprintf+0x734>
 804917a:	8b 55 0c             	mov    0xc(%ebp),%edx
 804917d:	8d 42 04             	lea    0x4(%edx),%eax
 8049180:	89 45 0c             	mov    %eax,0xc(%ebp)
 8049183:	8b 02                	mov    (%edx),%eax
 8049185:	88 45 97             	mov    %al,-0x69(%ebp)
 8049188:	8b 45 14             	mov    0x14(%ebp),%eax
 804918b:	89 44 24 10          	mov    %eax,0x10(%esp)
 804918f:	8b 45 10             	mov    0x10(%ebp),%eax
 8049192:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049196:	8d 45 98             	lea    -0x68(%ebp),%eax
 8049199:	89 44 24 08          	mov    %eax,0x8(%esp)
 804919d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80491a4:	00 
 80491a5:	8d 45 97             	lea    -0x69(%ebp),%eax
 80491a8:	89 04 24             	mov    %eax,(%esp)
 80491ab:	e8 c7 08 00 00       	call   8049a77 <format_string>
 80491b0:	e9 4f 02 00 00       	jmp    8049404 <__vprintf+0x734>
 80491b5:	8b 55 0c             	mov    0xc(%ebp),%edx
 80491b8:	8d 42 04             	lea    0x4(%edx),%eax
 80491bb:	89 45 0c             	mov    %eax,0xc(%ebp)
 80491be:	8b 02                	mov    (%edx),%eax
 80491c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 80491c3:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
 80491c7:	75 07                	jne    80491d0 <__vprintf+0x500>
 80491c9:	c7 45 d0 b4 b6 04 08 	movl   $0x804b6b4,-0x30(%ebp)
 80491d0:	8b 45 a0             	mov    -0x60(%ebp),%eax
 80491d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 80491d7:	8b 45 d0             	mov    -0x30(%ebp),%eax
 80491da:	89 04 24             	mov    %eax,(%esp)
 80491dd:	e8 6a 13 00 00       	call   804a54c <strnlen>
 80491e2:	89 c2                	mov    %eax,%edx
 80491e4:	8b 45 14             	mov    0x14(%ebp),%eax
 80491e7:	89 44 24 10          	mov    %eax,0x10(%esp)
 80491eb:	8b 45 10             	mov    0x10(%ebp),%eax
 80491ee:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80491f2:	8d 45 98             	lea    -0x68(%ebp),%eax
 80491f5:	89 44 24 08          	mov    %eax,0x8(%esp)
 80491f9:	89 54 24 04          	mov    %edx,0x4(%esp)
 80491fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8049200:	89 04 24             	mov    %eax,(%esp)
 8049203:	e8 6f 08 00 00       	call   8049a77 <format_string>
 8049208:	e9 f7 01 00 00       	jmp    8049404 <__vprintf+0x734>
 804920d:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049210:	8d 42 04             	lea    0x4(%edx),%eax
 8049213:	89 45 0c             	mov    %eax,0xc(%ebp)
 8049216:	8b 02                	mov    (%edx),%eax
 8049218:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804921b:	c7 45 98 08 00 00 00 	movl   $0x8,-0x68(%ebp)
 8049222:	8b 45 cc             	mov    -0x34(%ebp),%eax
 8049225:	89 c1                	mov    %eax,%ecx
 8049227:	bb 00 00 00 00       	mov    $0x0,%ebx
 804922c:	8b 45 14             	mov    0x14(%ebp),%eax
 804922f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 8049233:	8b 45 10             	mov    0x10(%ebp),%eax
 8049236:	89 44 24 18          	mov    %eax,0x18(%esp)
 804923a:	8d 45 98             	lea    -0x68(%ebp),%eax
 804923d:	89 44 24 14          	mov    %eax,0x14(%esp)
 8049241:	c7 44 24 10 f4 b5 04 	movl   $0x804b5f4,0x10(%esp)
 8049248:	08 
 8049249:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 8049250:	00 
 8049251:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8049258:	00 
 8049259:	89 0c 24             	mov    %ecx,(%esp)
 804925c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8049260:	e8 7f 04 00 00       	call   80496e4 <format_integer>
 8049265:	e9 9a 01 00 00       	jmp    8049404 <__vprintf+0x734>
 804926a:	8b 45 a0             	mov    -0x60(%ebp),%eax
 804926d:	85 c0                	test   %eax,%eax
 804926f:	79 08                	jns    8049279 <__vprintf+0x5a9>
 8049271:	b8 06 00 00 00       	mov    $0x6,%eax
 8049276:	89 45 a0             	mov    %eax,-0x60(%ebp)
 8049279:	8b 55 a0             	mov    -0x60(%ebp),%edx
 804927c:	b8 09 00 00 00       	mov    $0x9,%eax
 8049281:	39 c2                	cmp    %eax,%edx
 8049283:	7e 08                	jle    804928d <__vprintf+0x5bd>
 8049285:	b8 09 00 00 00       	mov    $0x9,%eax
 804928a:	89 45 a0             	mov    %eax,-0x60(%ebp)
 804928d:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049290:	8d 42 08             	lea    0x8(%edx),%eax
 8049293:	89 45 0c             	mov    %eax,0xc(%ebp)
 8049296:	dd 02                	fldl   (%edx)
 8049298:	dd 5d c0             	fstpl  -0x40(%ebp)
 804929b:	dd 45 c0             	fldl   -0x40(%ebp)
 804929e:	d9 7d 86             	fnstcw -0x7a(%ebp)
 80492a1:	0f b7 45 86          	movzwl -0x7a(%ebp),%eax
 80492a5:	66 0d 00 0c          	or     $0xc00,%ax
 80492a9:	66 89 45 84          	mov    %ax,-0x7c(%ebp)
 80492ad:	d9 6d 84             	fldcw  -0x7c(%ebp)
 80492b0:	db 5d bc             	fistpl -0x44(%ebp)
 80492b3:	d9 6d 86             	fldcw  -0x7a(%ebp)
 80492b6:	db 45 bc             	fildl  -0x44(%ebp)
 80492b9:	dd 45 c0             	fldl   -0x40(%ebp)
 80492bc:	de e1                	fsubp  %st,%st(1)
 80492be:	8b 45 a0             	mov    -0x60(%ebp),%eax
 80492c1:	8b 04 85 40 b6 04 08 	mov    0x804b640(,%eax,4),%eax
 80492c8:	89 45 80             	mov    %eax,-0x80(%ebp)
 80492cb:	db 45 80             	fildl  -0x80(%ebp)
 80492ce:	de c9                	fmulp  %st,%st(1)
 80492d0:	dd 5d b0             	fstpl  -0x50(%ebp)
 80492d3:	dd 45 b0             	fldl   -0x50(%ebp)
 80492d6:	d9 6d 84             	fldcw  -0x7c(%ebp)
 80492d9:	db 5d ac             	fistpl -0x54(%ebp)
 80492dc:	d9 6d 86             	fldcw  -0x7a(%ebp)
 80492df:	8b 45 a0             	mov    -0x60(%ebp),%eax
 80492e2:	89 45 a8             	mov    %eax,-0x58(%ebp)
 80492e5:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,-0x60(%ebp)
 80492ec:	dd 45 c0             	fldl   -0x40(%ebp)
 80492ef:	d9 ee                	fldz
 80492f1:	df f1                	fcomip %st(1),%st
 80492f3:	dd d8                	fstp   %st(0)
 80492f5:	0f 97 c0             	seta   %al
 80492f8:	0f b6 f0             	movzbl %al,%esi
 80492fb:	8b 45 bc             	mov    -0x44(%ebp),%eax
 80492fe:	89 c2                	mov    %eax,%edx
 8049300:	f7 da                	neg    %edx
 8049302:	0f 49 c2             	cmovns %edx,%eax
 8049305:	89 c1                	mov    %eax,%ecx
 8049307:	89 c3                	mov    %eax,%ebx
 8049309:	c1 fb 1f             	sar    $0x1f,%ebx
 804930c:	8b 45 14             	mov    0x14(%ebp),%eax
 804930f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 8049313:	8b 45 10             	mov    0x10(%ebp),%eax
 8049316:	89 44 24 18          	mov    %eax,0x18(%esp)
 804931a:	8d 45 98             	lea    -0x68(%ebp),%eax
 804931d:	89 44 24 14          	mov    %eax,0x14(%esp)
 8049321:	c7 44 24 10 b4 b5 04 	movl   $0x804b5b4,0x10(%esp)
 8049328:	08 
 8049329:	89 74 24 0c          	mov    %esi,0xc(%esp)
 804932d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8049334:	00 
 8049335:	89 0c 24             	mov    %ecx,(%esp)
 8049338:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 804933c:	e8 a3 03 00 00       	call   80496e4 <format_integer>
 8049341:	8b 45 14             	mov    0x14(%ebp),%eax
 8049344:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049348:	c7 04 24 2e 00 00 00 	movl   $0x2e,(%esp)
 804934f:	8b 45 10             	mov    0x10(%ebp),%eax
 8049352:	ff d0                	call   *%eax
 8049354:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
 8049358:	74 05                	je     804935f <__vprintf+0x68f>
 804935a:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804935d:	eb 05                	jmp    8049364 <__vprintf+0x694>
 804935f:	b8 01 00 00 00       	mov    $0x1,%eax
 8049364:	89 45 a0             	mov    %eax,-0x60(%ebp)
 8049367:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804936a:	89 c2                	mov    %eax,%edx
 804936c:	f7 da                	neg    %edx
 804936e:	0f 49 c2             	cmovns %edx,%eax
 8049371:	89 c1                	mov    %eax,%ecx
 8049373:	89 c3                	mov    %eax,%ebx
 8049375:	c1 fb 1f             	sar    $0x1f,%ebx
 8049378:	8b 45 14             	mov    0x14(%ebp),%eax
 804937b:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 804937f:	8b 45 10             	mov    0x10(%ebp),%eax
 8049382:	89 44 24 18          	mov    %eax,0x18(%esp)
 8049386:	8d 45 98             	lea    -0x68(%ebp),%eax
 8049389:	89 44 24 14          	mov    %eax,0x14(%esp)
 804938d:	c7 44 24 10 b4 b5 04 	movl   $0x804b5b4,0x10(%esp)
 8049394:	08 
 8049395:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804939c:	00 
 804939d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 80493a4:	00 
 80493a5:	89 0c 24             	mov    %ecx,(%esp)
 80493a8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 80493ac:	e8 33 03 00 00       	call   80496e4 <format_integer>
 80493b1:	eb 51                	jmp    8049404 <__vprintf+0x734>
 80493b3:	8b 45 08             	mov    0x8(%ebp),%eax
 80493b6:	0f b6 00             	movzbl (%eax),%eax
 80493b9:	0f be c0             	movsbl %al,%eax
 80493bc:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80493c0:	8b 45 14             	mov    0x14(%ebp),%eax
 80493c3:	89 44 24 08          	mov    %eax,0x8(%esp)
 80493c7:	8b 45 10             	mov    0x10(%ebp),%eax
 80493ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 80493ce:	c7 04 24 bb b6 04 08 	movl   $0x804b6bb,(%esp)
 80493d5:	e8 59 07 00 00       	call   8049b33 <__printf>
 80493da:	eb 28                	jmp    8049404 <__vprintf+0x734>
 80493dc:	8b 45 08             	mov    0x8(%ebp),%eax
 80493df:	0f b6 00             	movzbl (%eax),%eax
 80493e2:	0f be c0             	movsbl %al,%eax
 80493e5:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80493e9:	8b 45 14             	mov    0x14(%ebp),%eax
 80493ec:	89 44 24 08          	mov    %eax,0x8(%esp)
 80493f0:	8b 45 10             	mov    0x10(%ebp),%eax
 80493f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 80493f7:	c7 04 24 d1 b6 04 08 	movl   $0x804b6d1,(%esp)
 80493fe:	e8 30 07 00 00       	call   8049b33 <__printf>
 8049403:	90                   	nop
 8049404:	ff 45 08             	incl   0x8(%ebp)
 8049407:	8b 45 08             	mov    0x8(%ebp),%eax
 804940a:	0f b6 00             	movzbl (%eax),%eax
 804940d:	84 c0                	test   %al,%al
 804940f:	0f 85 cc f8 ff ff    	jne    8048ce1 <__vprintf+0x11>
 8049415:	90                   	nop
 8049416:	90                   	nop
 8049417:	81 c4 ac 00 00 00    	add    $0xac,%esp
 804941d:	5b                   	pop    %ebx
 804941e:	5e                   	pop    %esi
 804941f:	5f                   	pop    %edi
 8049420:	5d                   	pop    %ebp
 8049421:	c3                   	ret

08049422 <parse_conversion>:
 8049422:	55                   	push   %ebp
 8049423:	89 e5                	mov    %esp,%ebp
 8049425:	83 ec 04             	sub    $0x4,%esp
 8049428:	8b 45 0c             	mov    0xc(%ebp),%eax
 804942b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 8049431:	8b 45 08             	mov    0x8(%ebp),%eax
 8049434:	8d 50 01             	lea    0x1(%eax),%edx
 8049437:	89 55 08             	mov    %edx,0x8(%ebp)
 804943a:	0f b6 00             	movzbl (%eax),%eax
 804943d:	0f be c0             	movsbl %al,%eax
 8049440:	83 e8 20             	sub    $0x20,%eax
 8049443:	83 f8 10             	cmp    $0x10,%eax
 8049446:	77 6f                	ja     80494b7 <parse_conversion+0x95>
 8049448:	8b 04 85 58 b7 04 08 	mov    0x804b758(,%eax,4),%eax
 804944f:	ff e0                	jmp    *%eax
 8049451:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049454:	8b 00                	mov    (%eax),%eax
 8049456:	83 c8 01             	or     $0x1,%eax
 8049459:	89 c2                	mov    %eax,%edx
 804945b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804945e:	89 10                	mov    %edx,(%eax)
 8049460:	eb 67                	jmp    80494c9 <parse_conversion+0xa7>
 8049462:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049465:	8b 00                	mov    (%eax),%eax
 8049467:	83 c8 02             	or     $0x2,%eax
 804946a:	89 c2                	mov    %eax,%edx
 804946c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804946f:	89 10                	mov    %edx,(%eax)
 8049471:	eb 56                	jmp    80494c9 <parse_conversion+0xa7>
 8049473:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049476:	8b 00                	mov    (%eax),%eax
 8049478:	83 c8 04             	or     $0x4,%eax
 804947b:	89 c2                	mov    %eax,%edx
 804947d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049480:	89 10                	mov    %edx,(%eax)
 8049482:	eb 45                	jmp    80494c9 <parse_conversion+0xa7>
 8049484:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049487:	8b 00                	mov    (%eax),%eax
 8049489:	83 c8 08             	or     $0x8,%eax
 804948c:	89 c2                	mov    %eax,%edx
 804948e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049491:	89 10                	mov    %edx,(%eax)
 8049493:	eb 34                	jmp    80494c9 <parse_conversion+0xa7>
 8049495:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049498:	8b 00                	mov    (%eax),%eax
 804949a:	83 c8 10             	or     $0x10,%eax
 804949d:	89 c2                	mov    %eax,%edx
 804949f:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494a2:	89 10                	mov    %edx,(%eax)
 80494a4:	eb 23                	jmp    80494c9 <parse_conversion+0xa7>
 80494a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494a9:	8b 00                	mov    (%eax),%eax
 80494ab:	83 c8 20             	or     $0x20,%eax
 80494ae:	89 c2                	mov    %eax,%edx
 80494b0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494b3:	89 10                	mov    %edx,(%eax)
 80494b5:	eb 12                	jmp    80494c9 <parse_conversion+0xa7>
 80494b7:	ff 4d 08             	decl   0x8(%ebp)
 80494ba:	90                   	nop
 80494bb:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494be:	8b 00                	mov    (%eax),%eax
 80494c0:	83 e0 01             	and    $0x1,%eax
 80494c3:	85 c0                	test   %eax,%eax
 80494c5:	74 16                	je     80494dd <parse_conversion+0xbb>
 80494c7:	eb 05                	jmp    80494ce <parse_conversion+0xac>
 80494c9:	e9 63 ff ff ff       	jmp    8049431 <parse_conversion+0xf>
 80494ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494d1:	8b 00                	mov    (%eax),%eax
 80494d3:	83 e0 ef             	and    $0xffffffef,%eax
 80494d6:	89 c2                	mov    %eax,%edx
 80494d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494db:	89 10                	mov    %edx,(%eax)
 80494dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494e0:	8b 00                	mov    (%eax),%eax
 80494e2:	83 e0 02             	and    $0x2,%eax
 80494e5:	85 c0                	test   %eax,%eax
 80494e7:	74 0f                	je     80494f8 <parse_conversion+0xd6>
 80494e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494ec:	8b 00                	mov    (%eax),%eax
 80494ee:	83 e0 fb             	and    $0xfffffffb,%eax
 80494f1:	89 c2                	mov    %eax,%edx
 80494f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494f6:	89 10                	mov    %edx,(%eax)
 80494f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80494fb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 8049502:	8b 45 08             	mov    0x8(%ebp),%eax
 8049505:	0f b6 00             	movzbl (%eax),%eax
 8049508:	3c 2a                	cmp    $0x2a,%al
 804950a:	75 42                	jne    804954e <parse_conversion+0x12c>
 804950c:	ff 45 08             	incl   0x8(%ebp)
 804950f:	8b 45 10             	mov    0x10(%ebp),%eax
 8049512:	8b 00                	mov    (%eax),%eax
 8049514:	8d 48 04             	lea    0x4(%eax),%ecx
 8049517:	8b 55 10             	mov    0x10(%ebp),%edx
 804951a:	89 0a                	mov    %ecx,(%edx)
 804951c:	8b 10                	mov    (%eax),%edx
 804951e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049521:	89 50 04             	mov    %edx,0x4(%eax)
 8049524:	eb 3d                	jmp    8049563 <parse_conversion+0x141>
 8049526:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049529:	8b 50 04             	mov    0x4(%eax),%edx
 804952c:	89 d0                	mov    %edx,%eax
 804952e:	c1 e0 02             	shl    $0x2,%eax
 8049531:	01 d0                	add    %edx,%eax
 8049533:	01 c0                	add    %eax,%eax
 8049535:	89 c2                	mov    %eax,%edx
 8049537:	8b 45 08             	mov    0x8(%ebp),%eax
 804953a:	0f b6 00             	movzbl (%eax),%eax
 804953d:	0f be c0             	movsbl %al,%eax
 8049540:	01 d0                	add    %edx,%eax
 8049542:	8d 50 d0             	lea    -0x30(%eax),%edx
 8049545:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049548:	89 50 04             	mov    %edx,0x4(%eax)
 804954b:	ff 45 08             	incl   0x8(%ebp)
 804954e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049551:	0f b6 00             	movzbl (%eax),%eax
 8049554:	0f be c0             	movsbl %al,%eax
 8049557:	89 04 24             	mov    %eax,(%esp)
 804955a:	e8 3b f6 ff ff       	call   8048b9a <isdigit>
 804955f:	85 c0                	test   %eax,%eax
 8049561:	75 c3                	jne    8049526 <parse_conversion+0x104>
 8049563:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049566:	8b 40 04             	mov    0x4(%eax),%eax
 8049569:	85 c0                	test   %eax,%eax
 804956b:	79 1f                	jns    804958c <parse_conversion+0x16a>
 804956d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049570:	8b 40 04             	mov    0x4(%eax),%eax
 8049573:	f7 d8                	neg    %eax
 8049575:	89 c2                	mov    %eax,%edx
 8049577:	8b 45 0c             	mov    0xc(%ebp),%eax
 804957a:	89 50 04             	mov    %edx,0x4(%eax)
 804957d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049580:	8b 00                	mov    (%eax),%eax
 8049582:	83 c8 01             	or     $0x1,%eax
 8049585:	89 c2                	mov    %eax,%edx
 8049587:	8b 45 0c             	mov    0xc(%ebp),%eax
 804958a:	89 10                	mov    %edx,(%eax)
 804958c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804958f:	c7 40 08 ff ff ff ff 	movl   $0xffffffff,0x8(%eax)
 8049596:	8b 45 08             	mov    0x8(%ebp),%eax
 8049599:	0f b6 00             	movzbl (%eax),%eax
 804959c:	3c 2e                	cmp    $0x2e,%al
 804959e:	0f 85 84 00 00 00    	jne    8049628 <parse_conversion+0x206>
 80495a4:	ff 45 08             	incl   0x8(%ebp)
 80495a7:	8b 45 08             	mov    0x8(%ebp),%eax
 80495aa:	0f b6 00             	movzbl (%eax),%eax
 80495ad:	3c 2a                	cmp    $0x2a,%al
 80495af:	75 1a                	jne    80495cb <parse_conversion+0x1a9>
 80495b1:	ff 45 08             	incl   0x8(%ebp)
 80495b4:	8b 45 10             	mov    0x10(%ebp),%eax
 80495b7:	8b 00                	mov    (%eax),%eax
 80495b9:	8d 48 04             	lea    0x4(%eax),%ecx
 80495bc:	8b 55 10             	mov    0x10(%ebp),%edx
 80495bf:	89 0a                	mov    %ecx,(%edx)
 80495c1:	8b 10                	mov    (%eax),%edx
 80495c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495c6:	89 50 08             	mov    %edx,0x8(%eax)
 80495c9:	eb 49                	jmp    8049614 <parse_conversion+0x1f2>
 80495cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495ce:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 80495d5:	eb 28                	jmp    80495ff <parse_conversion+0x1dd>
 80495d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495da:	8b 50 08             	mov    0x8(%eax),%edx
 80495dd:	89 d0                	mov    %edx,%eax
 80495df:	c1 e0 02             	shl    $0x2,%eax
 80495e2:	01 d0                	add    %edx,%eax
 80495e4:	01 c0                	add    %eax,%eax
 80495e6:	89 c2                	mov    %eax,%edx
 80495e8:	8b 45 08             	mov    0x8(%ebp),%eax
 80495eb:	0f b6 00             	movzbl (%eax),%eax
 80495ee:	0f be c0             	movsbl %al,%eax
 80495f1:	01 d0                	add    %edx,%eax
 80495f3:	8d 50 d0             	lea    -0x30(%eax),%edx
 80495f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80495f9:	89 50 08             	mov    %edx,0x8(%eax)
 80495fc:	ff 45 08             	incl   0x8(%ebp)
 80495ff:	8b 45 08             	mov    0x8(%ebp),%eax
 8049602:	0f b6 00             	movzbl (%eax),%eax
 8049605:	0f be c0             	movsbl %al,%eax
 8049608:	89 04 24             	mov    %eax,(%esp)
 804960b:	e8 8a f5 ff ff       	call   8048b9a <isdigit>
 8049610:	85 c0                	test   %eax,%eax
 8049612:	75 c3                	jne    80495d7 <parse_conversion+0x1b5>
 8049614:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049617:	8b 40 08             	mov    0x8(%eax),%eax
 804961a:	85 c0                	test   %eax,%eax
 804961c:	79 0a                	jns    8049628 <parse_conversion+0x206>
 804961e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049621:	c7 40 08 ff ff ff ff 	movl   $0xffffffff,0x8(%eax)
 8049628:	8b 45 0c             	mov    0xc(%ebp),%eax
 804962b:	8b 40 08             	mov    0x8(%eax),%eax
 804962e:	85 c0                	test   %eax,%eax
 8049630:	78 0f                	js     8049641 <parse_conversion+0x21f>
 8049632:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049635:	8b 00                	mov    (%eax),%eax
 8049637:	83 e0 ef             	and    $0xffffffef,%eax
 804963a:	89 c2                	mov    %eax,%edx
 804963c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804963f:	89 10                	mov    %edx,(%eax)
 8049641:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049644:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
 804964b:	8b 45 08             	mov    0x8(%ebp),%eax
 804964e:	8d 50 01             	lea    0x1(%eax),%edx
 8049651:	89 55 08             	mov    %edx,0x8(%ebp)
 8049654:	0f b6 00             	movzbl (%eax),%eax
 8049657:	0f be c0             	movsbl %al,%eax
 804965a:	83 e8 68             	sub    $0x68,%eax
 804965d:	83 f8 12             	cmp    $0x12,%eax
 8049660:	77 77                	ja     80496d9 <parse_conversion+0x2b7>
 8049662:	8b 04 85 9c b7 04 08 	mov    0x804b79c(,%eax,4),%eax
 8049669:	ff e0                	jmp    *%eax
 804966b:	8b 45 08             	mov    0x8(%ebp),%eax
 804966e:	0f b6 00             	movzbl (%eax),%eax
 8049671:	3c 68                	cmp    $0x68,%al
 8049673:	75 0f                	jne    8049684 <parse_conversion+0x262>
 8049675:	ff 45 08             	incl   0x8(%ebp)
 8049678:	8b 45 0c             	mov    0xc(%ebp),%eax
 804967b:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
 8049682:	eb 59                	jmp    80496dd <parse_conversion+0x2bb>
 8049684:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049687:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
 804968e:	eb 4d                	jmp    80496dd <parse_conversion+0x2bb>
 8049690:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049693:	c7 40 0c 04 00 00 00 	movl   $0x4,0xc(%eax)
 804969a:	eb 41                	jmp    80496dd <parse_conversion+0x2bb>
 804969c:	8b 45 08             	mov    0x8(%ebp),%eax
 804969f:	0f b6 00             	movzbl (%eax),%eax
 80496a2:	3c 6c                	cmp    $0x6c,%al
 80496a4:	75 0f                	jne    80496b5 <parse_conversion+0x293>
 80496a6:	ff 45 08             	incl   0x8(%ebp)
 80496a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 80496ac:	c7 40 0c 06 00 00 00 	movl   $0x6,0xc(%eax)
 80496b3:	eb 28                	jmp    80496dd <parse_conversion+0x2bb>
 80496b5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80496b8:	c7 40 0c 05 00 00 00 	movl   $0x5,0xc(%eax)
 80496bf:	eb 1c                	jmp    80496dd <parse_conversion+0x2bb>
 80496c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80496c4:	c7 40 0c 07 00 00 00 	movl   $0x7,0xc(%eax)
 80496cb:	eb 10                	jmp    80496dd <parse_conversion+0x2bb>
 80496cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 80496d0:	c7 40 0c 08 00 00 00 	movl   $0x8,0xc(%eax)
 80496d7:	eb 04                	jmp    80496dd <parse_conversion+0x2bb>
 80496d9:	ff 4d 08             	decl   0x8(%ebp)
 80496dc:	90                   	nop
 80496dd:	8b 45 08             	mov    0x8(%ebp),%eax
 80496e0:	89 ec                	mov    %ebp,%esp
 80496e2:	5d                   	pop    %ebp
 80496e3:	c3                   	ret

080496e4 <format_integer>:
 80496e4:	55                   	push   %ebp
 80496e5:	89 e5                	mov    %esp,%ebp
 80496e7:	57                   	push   %edi
 80496e8:	56                   	push   %esi
 80496e9:	53                   	push   %ebx
 80496ea:	81 ec 9c 00 00 00    	sub    $0x9c,%esp
 80496f0:	8b 45 10             	mov    0x10(%ebp),%eax
 80496f3:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 80496f9:	8b 55 14             	mov    0x14(%ebp),%edx
 80496fc:	8b 45 08             	mov    0x8(%ebp),%eax
 80496ff:	89 45 80             	mov    %eax,-0x80(%ebp)
 8049702:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049705:	89 45 84             	mov    %eax,-0x7c(%ebp)
 8049708:	0f b6 85 74 ff ff ff 	movzbl -0x8c(%ebp),%eax
 804970f:	88 85 7c ff ff ff    	mov    %al,-0x84(%ebp)
 8049715:	88 d0                	mov    %dl,%al
 8049717:	88 85 78 ff ff ff    	mov    %al,-0x88(%ebp)
 804971d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 8049724:	80 bd 7c ff ff ff 00 	cmpb   $0x0,-0x84(%ebp)
 804972b:	74 5c                	je     8049789 <format_integer+0xa5>
 804972d:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8049730:	8b 00                	mov    (%eax),%eax
 8049732:	83 e0 02             	and    $0x2,%eax
 8049735:	85 c0                	test   %eax,%eax
 8049737:	74 1a                	je     8049753 <format_integer+0x6f>
 8049739:	80 bd 78 ff ff ff 00 	cmpb   $0x0,-0x88(%ebp)
 8049740:	74 07                	je     8049749 <format_integer+0x65>
 8049742:	b8 2d 00 00 00       	mov    $0x2d,%eax
 8049747:	eb 05                	jmp    804974e <format_integer+0x6a>
 8049749:	b8 2b 00 00 00       	mov    $0x2b,%eax
 804974e:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8049751:	eb 36                	jmp    8049789 <format_integer+0xa5>
 8049753:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8049756:	8b 00                	mov    (%eax),%eax
 8049758:	83 e0 04             	and    $0x4,%eax
 804975b:	85 c0                	test   %eax,%eax
 804975d:	74 1a                	je     8049779 <format_integer+0x95>
 804975f:	80 bd 78 ff ff ff 00 	cmpb   $0x0,-0x88(%ebp)
 8049766:	74 07                	je     804976f <format_integer+0x8b>
 8049768:	b8 2d 00 00 00       	mov    $0x2d,%eax
 804976d:	eb 05                	jmp    8049774 <format_integer+0x90>
 804976f:	b8 20 00 00 00       	mov    $0x20,%eax
 8049774:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8049777:	eb 10                	jmp    8049789 <format_integer+0xa5>
 8049779:	80 bd 78 ff ff ff 00 	cmpb   $0x0,-0x88(%ebp)
 8049780:	74 07                	je     8049789 <format_integer+0xa5>
 8049782:	c7 45 e0 2d 00 00 00 	movl   $0x2d,-0x20(%ebp)
 8049789:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804978c:	8b 00                	mov    (%eax),%eax
 804978e:	83 e0 08             	and    $0x8,%eax
 8049791:	85 c0                	test   %eax,%eax
 8049793:	74 20                	je     80497b5 <format_integer+0xd1>
 8049795:	8b 45 80             	mov    -0x80(%ebp),%eax
 8049798:	83 f0 00             	xor    $0x0,%eax
 804979b:	89 c1                	mov    %eax,%ecx
 804979d:	8b 45 84             	mov    -0x7c(%ebp),%eax
 80497a0:	83 f0 00             	xor    $0x0,%eax
 80497a3:	89 c3                	mov    %eax,%ebx
 80497a5:	89 d8                	mov    %ebx,%eax
 80497a7:	09 c8                	or     %ecx,%eax
 80497a9:	85 c0                	test   %eax,%eax
 80497ab:	74 08                	je     80497b5 <format_integer+0xd1>
 80497ad:	8b 45 18             	mov    0x18(%ebp),%eax
 80497b0:	8b 40 08             	mov    0x8(%eax),%eax
 80497b3:	eb 05                	jmp    80497ba <format_integer+0xd6>
 80497b5:	b8 00 00 00 00       	mov    $0x0,%eax
 80497ba:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 80497bd:	8d 45 90             	lea    -0x70(%ebp),%eax
 80497c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80497c3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 80497ca:	e9 a2 00 00 00       	jmp    8049871 <format_integer+0x18d>
 80497cf:	8b 45 1c             	mov    0x1c(%ebp),%eax
 80497d2:	8b 00                	mov    (%eax),%eax
 80497d4:	83 e0 20             	and    $0x20,%eax
 80497d7:	85 c0                	test   %eax,%eax
 80497d9:	74 24                	je     80497ff <format_integer+0x11b>
 80497db:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
 80497df:	7e 1e                	jle    80497ff <format_integer+0x11b>
 80497e1:	8b 45 18             	mov    0x18(%ebp),%eax
 80497e4:	8b 48 0c             	mov    0xc(%eax),%ecx
 80497e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
 80497ea:	99                   	cltd
 80497eb:	f7 f9                	idiv   %ecx
 80497ed:	89 d0                	mov    %edx,%eax
 80497ef:	85 c0                	test   %eax,%eax
 80497f1:	75 0c                	jne    80497ff <format_integer+0x11b>
 80497f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80497f6:	8d 50 01             	lea    0x1(%eax),%edx
 80497f9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 80497fc:	c6 00 2c             	movb   $0x2c,(%eax)
 80497ff:	8b 45 18             	mov    0x18(%ebp),%eax
 8049802:	8b 40 04             	mov    0x4(%eax),%eax
 8049805:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 804980b:	8b 45 18             	mov    0x18(%ebp),%eax
 804980e:	8b 00                	mov    (%eax),%eax
 8049810:	89 c1                	mov    %eax,%ecx
 8049812:	89 c3                	mov    %eax,%ebx
 8049814:	c1 fb 1f             	sar    $0x1f,%ebx
 8049817:	8b 45 80             	mov    -0x80(%ebp),%eax
 804981a:	8b 55 84             	mov    -0x7c(%ebp),%edx
 804981d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049821:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8049825:	89 04 24             	mov    %eax,(%esp)
 8049828:	89 54 24 04          	mov    %edx,0x4(%esp)
 804982c:	e8 8b 13 00 00       	call   804abbc <__umoddi3>
 8049831:	8b 9d 74 ff ff ff    	mov    -0x8c(%ebp),%ebx
 8049837:	8d 0c 03             	lea    (%ebx,%eax,1),%ecx
 804983a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804983d:	8d 50 01             	lea    0x1(%eax),%edx
 8049840:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8049843:	0f b6 11             	movzbl (%ecx),%edx
 8049846:	88 10                	mov    %dl,(%eax)
 8049848:	8b 45 18             	mov    0x18(%ebp),%eax
 804984b:	8b 00                	mov    (%eax),%eax
 804984d:	99                   	cltd
 804984e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049852:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049856:	8b 45 80             	mov    -0x80(%ebp),%eax
 8049859:	8b 55 84             	mov    -0x7c(%ebp),%edx
 804985c:	89 04 24             	mov    %eax,(%esp)
 804985f:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049863:	e8 12 13 00 00       	call   804ab7a <__udivdi3>
 8049868:	89 45 80             	mov    %eax,-0x80(%ebp)
 804986b:	89 55 84             	mov    %edx,-0x7c(%ebp)
 804986e:	ff 45 d8             	incl   -0x28(%ebp)
 8049871:	8b 45 80             	mov    -0x80(%ebp),%eax
 8049874:	83 f0 00             	xor    $0x0,%eax
 8049877:	89 c6                	mov    %eax,%esi
 8049879:	8b 45 84             	mov    -0x7c(%ebp),%eax
 804987c:	83 f0 00             	xor    $0x0,%eax
 804987f:	89 c7                	mov    %eax,%edi
 8049881:	89 f8                	mov    %edi,%eax
 8049883:	09 f0                	or     %esi,%eax
 8049885:	85 c0                	test   %eax,%eax
 8049887:	0f 85 42 ff ff ff    	jne    80497cf <format_integer+0xeb>
 804988d:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8049890:	8b 40 08             	mov    0x8(%eax),%eax
 8049893:	85 c0                	test   %eax,%eax
 8049895:	78 08                	js     804989f <format_integer+0x1bb>
 8049897:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804989a:	8b 40 08             	mov    0x8(%eax),%eax
 804989d:	eb 05                	jmp    80498a4 <format_integer+0x1c0>
 804989f:	b8 01 00 00 00       	mov    $0x1,%eax
 80498a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 80498a7:	eb 0c                	jmp    80498b5 <format_integer+0x1d1>
 80498a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80498ac:	8d 50 01             	lea    0x1(%eax),%edx
 80498af:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 80498b2:	c6 00 30             	movb   $0x30,(%eax)
 80498b5:	8d 55 90             	lea    -0x70(%ebp),%edx
 80498b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80498bb:	29 d0                	sub    %edx,%eax
 80498bd:	39 45 d0             	cmp    %eax,-0x30(%ebp)
 80498c0:	7e 0b                	jle    80498cd <format_integer+0x1e9>
 80498c2:	8d 45 90             	lea    -0x70(%ebp),%eax
 80498c5:	83 c0 3f             	add    $0x3f,%eax
 80498c8:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 80498cb:	72 dc                	jb     80498a9 <format_integer+0x1c5>
 80498cd:	8b 45 1c             	mov    0x1c(%ebp),%eax
 80498d0:	8b 00                	mov    (%eax),%eax
 80498d2:	83 e0 08             	and    $0x8,%eax
 80498d5:	85 c0                	test   %eax,%eax
 80498d7:	74 29                	je     8049902 <format_integer+0x21e>
 80498d9:	8b 45 18             	mov    0x18(%ebp),%eax
 80498dc:	8b 00                	mov    (%eax),%eax
 80498de:	83 f8 08             	cmp    $0x8,%eax
 80498e1:	75 1f                	jne    8049902 <format_integer+0x21e>
 80498e3:	8d 45 90             	lea    -0x70(%ebp),%eax
 80498e6:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 80498e9:	74 0b                	je     80498f6 <format_integer+0x212>
 80498eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80498ee:	48                   	dec    %eax
 80498ef:	0f b6 00             	movzbl (%eax),%eax
 80498f2:	3c 30                	cmp    $0x30,%al
 80498f4:	74 0c                	je     8049902 <format_integer+0x21e>
 80498f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80498f9:	8d 50 01             	lea    0x1(%eax),%edx
 80498fc:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 80498ff:	c6 00 30             	movb   $0x30,(%eax)
 8049902:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8049905:	8b 40 04             	mov    0x4(%eax),%eax
 8049908:	8d 4d 90             	lea    -0x70(%ebp),%ecx
 804990b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804990e:	29 ca                	sub    %ecx,%edx
 8049910:	29 d0                	sub    %edx,%eax
 8049912:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 8049916:	74 07                	je     804991f <format_integer+0x23b>
 8049918:	ba 02 00 00 00       	mov    $0x2,%edx
 804991d:	eb 05                	jmp    8049924 <format_integer+0x240>
 804991f:	ba 00 00 00 00       	mov    $0x0,%edx
 8049924:	29 d0                	sub    %edx,%eax
 8049926:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 804992a:	0f 95 c2             	setne  %dl
 804992d:	0f b6 d2             	movzbl %dl,%edx
 8049930:	29 d0                	sub    %edx,%eax
 8049932:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8049935:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 8049939:	79 07                	jns    8049942 <format_integer+0x25e>
 804993b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8049942:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8049945:	8b 00                	mov    (%eax),%eax
 8049947:	83 e0 11             	and    $0x11,%eax
 804994a:	85 c0                	test   %eax,%eax
 804994c:	75 21                	jne    804996f <format_integer+0x28b>
 804994e:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8049951:	8b 55 24             	mov    0x24(%ebp),%edx
 8049954:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049958:	8b 55 20             	mov    0x20(%ebp),%edx
 804995b:	89 54 24 08          	mov    %edx,0x8(%esp)
 804995f:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049963:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 804996a:	e8 d4 00 00 00       	call   8049a43 <output_dup>
 804996f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8049973:	74 15                	je     804998a <format_integer+0x2a6>
 8049975:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049978:	0f be c0             	movsbl %al,%eax
 804997b:	8b 55 24             	mov    0x24(%ebp),%edx
 804997e:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049982:	89 04 24             	mov    %eax,(%esp)
 8049985:	8b 45 20             	mov    0x20(%ebp),%eax
 8049988:	ff d0                	call   *%eax
 804998a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 804998e:	74 28                	je     80499b8 <format_integer+0x2d4>
 8049990:	8b 45 24             	mov    0x24(%ebp),%eax
 8049993:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049997:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
 804999e:	8b 45 20             	mov    0x20(%ebp),%eax
 80499a1:	ff d0                	call   *%eax
 80499a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 80499a6:	0f be c0             	movsbl %al,%eax
 80499a9:	8b 55 24             	mov    0x24(%ebp),%edx
 80499ac:	89 54 24 04          	mov    %edx,0x4(%esp)
 80499b0:	89 04 24             	mov    %eax,(%esp)
 80499b3:	8b 45 20             	mov    0x20(%ebp),%eax
 80499b6:	ff d0                	call   *%eax
 80499b8:	8b 45 1c             	mov    0x1c(%ebp),%eax
 80499bb:	8b 00                	mov    (%eax),%eax
 80499bd:	83 e0 10             	and    $0x10,%eax
 80499c0:	85 c0                	test   %eax,%eax
 80499c2:	74 3e                	je     8049a02 <format_integer+0x31e>
 80499c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
 80499c7:	8b 55 24             	mov    0x24(%ebp),%edx
 80499ca:	89 54 24 0c          	mov    %edx,0xc(%esp)
 80499ce:	8b 55 20             	mov    0x20(%ebp),%edx
 80499d1:	89 54 24 08          	mov    %edx,0x8(%esp)
 80499d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499d9:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
 80499e0:	e8 5e 00 00 00       	call   8049a43 <output_dup>
 80499e5:	eb 1b                	jmp    8049a02 <format_integer+0x31e>
 80499e7:	ff 4d e4             	decl   -0x1c(%ebp)
 80499ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80499ed:	0f b6 00             	movzbl (%eax),%eax
 80499f0:	0f be c0             	movsbl %al,%eax
 80499f3:	8b 55 24             	mov    0x24(%ebp),%edx
 80499f6:	89 54 24 04          	mov    %edx,0x4(%esp)
 80499fa:	89 04 24             	mov    %eax,(%esp)
 80499fd:	8b 45 20             	mov    0x20(%ebp),%eax
 8049a00:	ff d0                	call   *%eax
 8049a02:	8d 45 90             	lea    -0x70(%ebp),%eax
 8049a05:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 8049a08:	77 dd                	ja     80499e7 <format_integer+0x303>
 8049a0a:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8049a0d:	8b 00                	mov    (%eax),%eax
 8049a0f:	83 e0 01             	and    $0x1,%eax
 8049a12:	85 c0                	test   %eax,%eax
 8049a14:	74 21                	je     8049a37 <format_integer+0x353>
 8049a16:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8049a19:	8b 55 24             	mov    0x24(%ebp),%edx
 8049a1c:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049a20:	8b 55 20             	mov    0x20(%ebp),%edx
 8049a23:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049a27:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a2b:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 8049a32:	e8 0c 00 00 00       	call   8049a43 <output_dup>
 8049a37:	90                   	nop
 8049a38:	81 c4 9c 00 00 00    	add    $0x9c,%esp
 8049a3e:	5b                   	pop    %ebx
 8049a3f:	5e                   	pop    %esi
 8049a40:	5f                   	pop    %edi
 8049a41:	5d                   	pop    %ebp
 8049a42:	c3                   	ret

08049a43 <output_dup>:
 8049a43:	55                   	push   %ebp
 8049a44:	89 e5                	mov    %esp,%ebp
 8049a46:	83 ec 28             	sub    $0x28,%esp
 8049a49:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a4c:	88 45 f4             	mov    %al,-0xc(%ebp)
 8049a4f:	eb 13                	jmp    8049a64 <output_dup+0x21>
 8049a51:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
 8049a55:	8b 55 14             	mov    0x14(%ebp),%edx
 8049a58:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049a5c:	89 04 24             	mov    %eax,(%esp)
 8049a5f:	8b 45 10             	mov    0x10(%ebp),%eax
 8049a62:	ff d0                	call   *%eax
 8049a64:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a67:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049a6a:	89 55 0c             	mov    %edx,0xc(%ebp)
 8049a6d:	85 c0                	test   %eax,%eax
 8049a6f:	75 e0                	jne    8049a51 <output_dup+0xe>
 8049a71:	90                   	nop
 8049a72:	90                   	nop
 8049a73:	89 ec                	mov    %ebp,%esp
 8049a75:	5d                   	pop    %ebp
 8049a76:	c3                   	ret

08049a77 <format_string>:
 8049a77:	55                   	push   %ebp
 8049a78:	89 e5                	mov    %esp,%ebp
 8049a7a:	83 ec 28             	sub    $0x28,%esp
 8049a7d:	8b 45 10             	mov    0x10(%ebp),%eax
 8049a80:	8b 40 04             	mov    0x4(%eax),%eax
 8049a83:	39 45 0c             	cmp    %eax,0xc(%ebp)
 8049a86:	7d 35                	jge    8049abd <format_string+0x46>
 8049a88:	8b 45 10             	mov    0x10(%ebp),%eax
 8049a8b:	8b 00                	mov    (%eax),%eax
 8049a8d:	83 e0 01             	and    $0x1,%eax
 8049a90:	85 c0                	test   %eax,%eax
 8049a92:	75 29                	jne    8049abd <format_string+0x46>
 8049a94:	8b 45 10             	mov    0x10(%ebp),%eax
 8049a97:	8b 40 04             	mov    0x4(%eax),%eax
 8049a9a:	2b 45 0c             	sub    0xc(%ebp),%eax
 8049a9d:	89 c2                	mov    %eax,%edx
 8049a9f:	8b 45 18             	mov    0x18(%ebp),%eax
 8049aa2:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049aa6:	8b 45 14             	mov    0x14(%ebp),%eax
 8049aa9:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049aad:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049ab1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 8049ab8:	e8 86 ff ff ff       	call   8049a43 <output_dup>
 8049abd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049ac4:	eb 20                	jmp    8049ae6 <format_string+0x6f>
 8049ac6:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049ac9:	8b 45 08             	mov    0x8(%ebp),%eax
 8049acc:	01 d0                	add    %edx,%eax
 8049ace:	0f b6 00             	movzbl (%eax),%eax
 8049ad1:	0f be c0             	movsbl %al,%eax
 8049ad4:	8b 55 18             	mov    0x18(%ebp),%edx
 8049ad7:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049adb:	89 04 24             	mov    %eax,(%esp)
 8049ade:	8b 45 14             	mov    0x14(%ebp),%eax
 8049ae1:	ff d0                	call   *%eax
 8049ae3:	ff 45 f4             	incl   -0xc(%ebp)
 8049ae6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049ae9:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8049aec:	7c d8                	jl     8049ac6 <format_string+0x4f>
 8049aee:	8b 45 10             	mov    0x10(%ebp),%eax
 8049af1:	8b 40 04             	mov    0x4(%eax),%eax
 8049af4:	39 45 0c             	cmp    %eax,0xc(%ebp)
 8049af7:	7d 35                	jge    8049b2e <format_string+0xb7>
 8049af9:	8b 45 10             	mov    0x10(%ebp),%eax
 8049afc:	8b 00                	mov    (%eax),%eax
 8049afe:	83 e0 01             	and    $0x1,%eax
 8049b01:	85 c0                	test   %eax,%eax
 8049b03:	74 29                	je     8049b2e <format_string+0xb7>
 8049b05:	8b 45 10             	mov    0x10(%ebp),%eax
 8049b08:	8b 40 04             	mov    0x4(%eax),%eax
 8049b0b:	2b 45 0c             	sub    0xc(%ebp),%eax
 8049b0e:	89 c2                	mov    %eax,%edx
 8049b10:	8b 45 18             	mov    0x18(%ebp),%eax
 8049b13:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049b17:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b1a:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049b1e:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049b22:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 8049b29:	e8 15 ff ff ff       	call   8049a43 <output_dup>
 8049b2e:	90                   	nop
 8049b2f:	89 ec                	mov    %ebp,%esp
 8049b31:	5d                   	pop    %ebp
 8049b32:	c3                   	ret

08049b33 <__printf>:
 8049b33:	55                   	push   %ebp
 8049b34:	89 e5                	mov    %esp,%ebp
 8049b36:	83 ec 28             	sub    $0x28,%esp
 8049b39:	8d 45 14             	lea    0x14(%ebp),%eax
 8049b3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049b3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049b42:	8b 55 10             	mov    0x10(%ebp),%edx
 8049b45:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049b49:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049b4c:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049b50:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b54:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b57:	89 04 24             	mov    %eax,(%esp)
 8049b5a:	e8 71 f1 ff ff       	call   8048cd0 <__vprintf>
 8049b5f:	90                   	nop
 8049b60:	89 ec                	mov    %ebp,%esp
 8049b62:	5d                   	pop    %ebp
 8049b63:	c3                   	ret

08049b64 <hex_dump>:
 8049b64:	55                   	push   %ebp
 8049b65:	89 e5                	mov    %esp,%ebp
 8049b67:	83 ec 48             	sub    $0x48,%esp
 8049b6a:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b6d:	88 45 d4             	mov    %al,-0x2c(%ebp)
 8049b70:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b73:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049b76:	c7 45 e8 10 00 00 00 	movl   $0x10,-0x18(%ebp)
 8049b7d:	e9 a6 01 00 00       	jmp    8049d28 <hex_dump+0x1c4>
 8049b82:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b85:	ba 00 00 00 00       	mov    $0x0,%edx
 8049b8a:	f7 75 e8             	divl   -0x18(%ebp)
 8049b8d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8049b90:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049b93:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049b96:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049b99:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8049b9c:	39 45 10             	cmp    %eax,0x10(%ebp)
 8049b9f:	73 0b                	jae    8049bac <hex_dump+0x48>
 8049ba1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8049ba4:	8b 45 10             	mov    0x10(%ebp),%eax
 8049ba7:	01 d0                	add    %edx,%eax
 8049ba9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049bac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049baf:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8049bb2:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8049bb5:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bb8:	ba 00 00 00 00       	mov    $0x0,%edx
 8049bbd:	f7 75 e8             	divl   -0x18(%ebp)
 8049bc0:	0f af 45 e8          	imul   -0x18(%ebp),%eax
 8049bc4:	ba 00 00 00 00       	mov    $0x0,%edx
 8049bc9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049bcd:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049bd1:	c7 04 24 e8 b7 04 08 	movl   $0x804b7e8,(%esp)
 8049bd8:	e8 cb f0 ff ff       	call   8048ca8 <printf>
 8049bdd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8049be4:	eb 0f                	jmp    8049bf5 <hex_dump+0x91>
 8049be6:	c7 04 24 f0 b7 04 08 	movl   $0x804b7f0,(%esp)
 8049bed:	e8 b6 f0 ff ff       	call   8048ca8 <printf>
 8049bf2:	ff 45 ec             	incl   -0x14(%ebp)
 8049bf5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049bf8:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 8049bfb:	72 e9                	jb     8049be6 <hex_dump+0x82>
 8049bfd:	eb 41                	jmp    8049c40 <hex_dump+0xdc>
 8049bff:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049c02:	d1 e8                	shr    $1,%eax
 8049c04:	48                   	dec    %eax
 8049c05:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 8049c08:	75 07                	jne    8049c11 <hex_dump+0xad>
 8049c0a:	ba 2d 00 00 00       	mov    $0x2d,%edx
 8049c0f:	eb 05                	jmp    8049c16 <hex_dump+0xb2>
 8049c11:	ba 20 00 00 00       	mov    $0x20,%edx
 8049c16:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049c19:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8049c1c:	89 c1                	mov    %eax,%ecx
 8049c1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049c21:	01 c8                	add    %ecx,%eax
 8049c23:	0f b6 00             	movzbl (%eax),%eax
 8049c26:	0f b6 c0             	movzbl %al,%eax
 8049c29:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049c2d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049c31:	c7 04 24 f4 b7 04 08 	movl   $0x804b7f4,(%esp)
 8049c38:	e8 6b f0 ff ff       	call   8048ca8 <printf>
 8049c3d:	ff 45 ec             	incl   -0x14(%ebp)
 8049c40:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049c43:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049c46:	72 b7                	jb     8049bff <hex_dump+0x9b>
 8049c48:	80 7d d4 00          	cmpb   $0x0,-0x2c(%ebp)
 8049c4c:	0f 84 b8 00 00 00    	je     8049d0a <hex_dump+0x1a6>
 8049c52:	eb 0f                	jmp    8049c63 <hex_dump+0xff>
 8049c54:	c7 04 24 f0 b7 04 08 	movl   $0x804b7f0,(%esp)
 8049c5b:	e8 48 f0 ff ff       	call   8048ca8 <printf>
 8049c60:	ff 45 ec             	incl   -0x14(%ebp)
 8049c63:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049c66:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 8049c69:	72 e9                	jb     8049c54 <hex_dump+0xf0>
 8049c6b:	c7 04 24 7c 00 00 00 	movl   $0x7c,(%esp)
 8049c72:	e8 35 15 00 00       	call   804b1ac <putchar>
 8049c77:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8049c7e:	eb 0f                	jmp    8049c8f <hex_dump+0x12b>
 8049c80:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 8049c87:	e8 20 15 00 00       	call   804b1ac <putchar>
 8049c8c:	ff 45 ec             	incl   -0x14(%ebp)
 8049c8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049c92:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 8049c95:	72 e9                	jb     8049c80 <hex_dump+0x11c>
 8049c97:	eb 44                	jmp    8049cdd <hex_dump+0x179>
 8049c99:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049c9c:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8049c9f:	89 c2                	mov    %eax,%edx
 8049ca1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049ca4:	01 d0                	add    %edx,%eax
 8049ca6:	0f b6 00             	movzbl (%eax),%eax
 8049ca9:	0f b6 c0             	movzbl %al,%eax
 8049cac:	89 04 24             	mov    %eax,(%esp)
 8049caf:	e8 03 ef ff ff       	call   8048bb7 <isprint>
 8049cb4:	85 c0                	test   %eax,%eax
 8049cb6:	74 15                	je     8049ccd <hex_dump+0x169>
 8049cb8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049cbb:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8049cbe:	89 c2                	mov    %eax,%edx
 8049cc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049cc3:	01 d0                	add    %edx,%eax
 8049cc5:	0f b6 00             	movzbl (%eax),%eax
 8049cc8:	0f b6 c0             	movzbl %al,%eax
 8049ccb:	eb 05                	jmp    8049cd2 <hex_dump+0x16e>
 8049ccd:	b8 2e 00 00 00       	mov    $0x2e,%eax
 8049cd2:	89 04 24             	mov    %eax,(%esp)
 8049cd5:	e8 d2 14 00 00       	call   804b1ac <putchar>
 8049cda:	ff 45 ec             	incl   -0x14(%ebp)
 8049cdd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049ce0:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049ce3:	72 b4                	jb     8049c99 <hex_dump+0x135>
 8049ce5:	eb 0f                	jmp    8049cf6 <hex_dump+0x192>
 8049ce7:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 8049cee:	e8 b9 14 00 00       	call   804b1ac <putchar>
 8049cf3:	ff 45 ec             	incl   -0x14(%ebp)
 8049cf6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049cf9:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 8049cfc:	72 e9                	jb     8049ce7 <hex_dump+0x183>
 8049cfe:	c7 04 24 7c 00 00 00 	movl   $0x7c,(%esp)
 8049d05:	e8 a2 14 00 00       	call   804b1ac <putchar>
 8049d0a:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 8049d11:	e8 96 14 00 00       	call   804b1ac <putchar>
 8049d16:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049d19:	01 45 08             	add    %eax,0x8(%ebp)
 8049d1c:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049d1f:	01 45 f4             	add    %eax,-0xc(%ebp)
 8049d22:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049d25:	29 45 10             	sub    %eax,0x10(%ebp)
 8049d28:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049d2c:	0f 85 50 fe ff ff    	jne    8049b82 <hex_dump+0x1e>
 8049d32:	90                   	nop
 8049d33:	90                   	nop
 8049d34:	89 ec                	mov    %ebp,%esp
 8049d36:	5d                   	pop    %ebp
 8049d37:	c3                   	ret

08049d38 <print_human_readable_size>:
 8049d38:	55                   	push   %ebp
 8049d39:	89 e5                	mov    %esp,%ebp
 8049d3b:	83 ec 38             	sub    $0x38,%esp
 8049d3e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8049d41:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8049d44:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8049d47:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8049d4a:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8049d4d:	83 f1 01             	xor    $0x1,%ecx
 8049d50:	89 c8                	mov    %ecx,%eax
 8049d52:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8049d55:	83 f1 00             	xor    $0x0,%ecx
 8049d58:	89 ca                	mov    %ecx,%edx
 8049d5a:	09 d0                	or     %edx,%eax
 8049d5c:	85 c0                	test   %eax,%eax
 8049d5e:	75 0e                	jne    8049d6e <print_human_readable_size+0x36>
 8049d60:	c7 04 24 fd b7 04 08 	movl   $0x804b7fd,(%esp)
 8049d67:	e8 3c ef ff ff       	call   8048ca8 <printf>
 8049d6c:	eb 61                	jmp    8049dcf <print_human_readable_size+0x97>
 8049d6e:	c7 45 f4 d0 ca 04 08 	movl   $0x804cad0,-0xc(%ebp)
 8049d75:	eb 17                	jmp    8049d8e <print_human_readable_size+0x56>
 8049d77:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049d7a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8049d7d:	0f ac d0 0a          	shrd   $0xa,%edx,%eax
 8049d81:	c1 ea 0a             	shr    $0xa,%edx
 8049d84:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8049d87:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8049d8a:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 8049d8e:	ba ff 03 00 00       	mov    $0x3ff,%edx
 8049d93:	b8 00 00 00 00       	mov    $0x0,%eax
 8049d98:	3b 55 e0             	cmp    -0x20(%ebp),%edx
 8049d9b:	1b 45 e4             	sbb    -0x1c(%ebp),%eax
 8049d9e:	73 0c                	jae    8049dac <print_human_readable_size+0x74>
 8049da0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049da3:	83 c0 04             	add    $0x4,%eax
 8049da6:	8b 00                	mov    (%eax),%eax
 8049da8:	85 c0                	test   %eax,%eax
 8049daa:	75 cb                	jne    8049d77 <print_human_readable_size+0x3f>
 8049dac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049daf:	8b 00                	mov    (%eax),%eax
 8049db1:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049db5:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8049db8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8049dbb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049dbf:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049dc3:	c7 04 24 04 b8 04 08 	movl   $0x804b804,(%esp)
 8049dca:	e8 d9 ee ff ff       	call   8048ca8 <printf>
 8049dcf:	90                   	nop
 8049dd0:	89 ec                	mov    %ebp,%esp
 8049dd2:	5d                   	pop    %ebp
 8049dd3:	c3                   	ret

08049dd4 <memcpy>:
 8049dd4:	55                   	push   %ebp
 8049dd5:	89 e5                	mov    %esp,%ebp
 8049dd7:	83 ec 38             	sub    $0x38,%esp
 8049dda:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ddd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049de0:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049de3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049de6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049dea:	75 32                	jne    8049e1e <memcpy+0x4a>
 8049dec:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049df0:	74 2c                	je     8049e1e <memcpy+0x4a>
 8049df2:	c7 44 24 10 28 b8 04 	movl   $0x804b828,0x10(%esp)
 8049df9:	08 
 8049dfa:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 8049e01:	08 
 8049e02:	c7 44 24 08 38 b9 04 	movl   $0x804b938,0x8(%esp)
 8049e09:	08 
 8049e0a:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
 8049e11:	00 
 8049e12:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 8049e19:	e8 e5 0d 00 00       	call   804ac03 <debug_panic>
 8049e1e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049e22:	75 49                	jne    8049e6d <memcpy+0x99>
 8049e24:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049e28:	74 43                	je     8049e6d <memcpy+0x99>
 8049e2a:	c7 44 24 10 6b b8 04 	movl   $0x804b86b,0x10(%esp)
 8049e31:	08 
 8049e32:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 8049e39:	08 
 8049e3a:	c7 44 24 08 38 b9 04 	movl   $0x804b938,0x8(%esp)
 8049e41:	08 
 8049e42:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
 8049e49:	00 
 8049e4a:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 8049e51:	e8 ad 0d 00 00       	call   804ac03 <debug_panic>
 8049e56:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8049e59:	8d 42 01             	lea    0x1(%edx),%eax
 8049e5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049e5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049e62:	8d 48 01             	lea    0x1(%eax),%ecx
 8049e65:	89 4d f4             	mov    %ecx,-0xc(%ebp)
 8049e68:	0f b6 12             	movzbl (%edx),%edx
 8049e6b:	88 10                	mov    %dl,(%eax)
 8049e6d:	8b 45 10             	mov    0x10(%ebp),%eax
 8049e70:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049e73:	89 55 10             	mov    %edx,0x10(%ebp)
 8049e76:	85 c0                	test   %eax,%eax
 8049e78:	75 dc                	jne    8049e56 <memcpy+0x82>
 8049e7a:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e7d:	89 ec                	mov    %ebp,%esp
 8049e7f:	5d                   	pop    %ebp
 8049e80:	c3                   	ret

08049e81 <memmove>:
 8049e81:	55                   	push   %ebp
 8049e82:	89 e5                	mov    %esp,%ebp
 8049e84:	83 ec 38             	sub    $0x38,%esp
 8049e87:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049e8d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049e90:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049e93:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049e97:	75 32                	jne    8049ecb <memmove+0x4a>
 8049e99:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049e9d:	74 2c                	je     8049ecb <memmove+0x4a>
 8049e9f:	c7 44 24 10 28 b8 04 	movl   $0x804b828,0x10(%esp)
 8049ea6:	08 
 8049ea7:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 8049eae:	08 
 8049eaf:	c7 44 24 08 40 b9 04 	movl   $0x804b940,0x8(%esp)
 8049eb6:	08 
 8049eb7:	c7 44 24 04 1d 00 00 	movl   $0x1d,0x4(%esp)
 8049ebe:	00 
 8049ebf:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 8049ec6:	e8 38 0d 00 00       	call   804ac03 <debug_panic>
 8049ecb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049ecf:	75 32                	jne    8049f03 <memmove+0x82>
 8049ed1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049ed5:	74 2c                	je     8049f03 <memmove+0x82>
 8049ed7:	c7 44 24 10 6b b8 04 	movl   $0x804b86b,0x10(%esp)
 8049ede:	08 
 8049edf:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 8049ee6:	08 
 8049ee7:	c7 44 24 08 40 b9 04 	movl   $0x804b940,0x8(%esp)
 8049eee:	08 
 8049eef:	c7 44 24 04 1e 00 00 	movl   $0x1e,0x4(%esp)
 8049ef6:	00 
 8049ef7:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 8049efe:	e8 00 0d 00 00       	call   804ac03 <debug_panic>
 8049f03:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049f06:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049f09:	73 28                	jae    8049f33 <memmove+0xb2>
 8049f0b:	eb 17                	jmp    8049f24 <memmove+0xa3>
 8049f0d:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8049f10:	8d 42 01             	lea    0x1(%edx),%eax
 8049f13:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049f16:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049f19:	8d 48 01             	lea    0x1(%eax),%ecx
 8049f1c:	89 4d f4             	mov    %ecx,-0xc(%ebp)
 8049f1f:	0f b6 12             	movzbl (%edx),%edx
 8049f22:	88 10                	mov    %dl,(%eax)
 8049f24:	8b 45 10             	mov    0x10(%ebp),%eax
 8049f27:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049f2a:	89 55 10             	mov    %edx,0x10(%ebp)
 8049f2d:	85 c0                	test   %eax,%eax
 8049f2f:	75 dc                	jne    8049f0d <memmove+0x8c>
 8049f31:	eb 2c                	jmp    8049f5f <memmove+0xde>
 8049f33:	8b 45 10             	mov    0x10(%ebp),%eax
 8049f36:	01 45 f4             	add    %eax,-0xc(%ebp)
 8049f39:	8b 45 10             	mov    0x10(%ebp),%eax
 8049f3c:	01 45 f0             	add    %eax,-0x10(%ebp)
 8049f3f:	eb 11                	jmp    8049f52 <memmove+0xd1>
 8049f41:	ff 4d f0             	decl   -0x10(%ebp)
 8049f44:	ff 4d f4             	decl   -0xc(%ebp)
 8049f47:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049f4a:	0f b6 10             	movzbl (%eax),%edx
 8049f4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049f50:	88 10                	mov    %dl,(%eax)
 8049f52:	8b 45 10             	mov    0x10(%ebp),%eax
 8049f55:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049f58:	89 55 10             	mov    %edx,0x10(%ebp)
 8049f5b:	85 c0                	test   %eax,%eax
 8049f5d:	75 e2                	jne    8049f41 <memmove+0xc0>
 8049f5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049f62:	89 ec                	mov    %ebp,%esp
 8049f64:	5d                   	pop    %ebp
 8049f65:	c3                   	ret

08049f66 <memcmp>:
 8049f66:	55                   	push   %ebp
 8049f67:	89 e5                	mov    %esp,%ebp
 8049f69:	83 ec 38             	sub    $0x38,%esp
 8049f6c:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049f72:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049f75:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049f78:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049f7c:	75 32                	jne    8049fb0 <memcmp+0x4a>
 8049f7e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049f82:	74 2c                	je     8049fb0 <memcmp+0x4a>
 8049f84:	c7 44 24 10 84 b8 04 	movl   $0x804b884,0x10(%esp)
 8049f8b:	08 
 8049f8c:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 8049f93:	08 
 8049f94:	c7 44 24 08 48 b9 04 	movl   $0x804b948,0x8(%esp)
 8049f9b:	08 
 8049f9c:	c7 44 24 04 35 00 00 	movl   $0x35,0x4(%esp)
 8049fa3:	00 
 8049fa4:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 8049fab:	e8 53 0c 00 00       	call   804ac03 <debug_panic>
 8049fb0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049fb4:	75 66                	jne    804a01c <memcmp+0xb6>
 8049fb6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049fba:	74 60                	je     804a01c <memcmp+0xb6>
 8049fbc:	c7 44 24 10 9b b8 04 	movl   $0x804b89b,0x10(%esp)
 8049fc3:	08 
 8049fc4:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 8049fcb:	08 
 8049fcc:	c7 44 24 08 48 b9 04 	movl   $0x804b948,0x8(%esp)
 8049fd3:	08 
 8049fd4:	c7 44 24 04 36 00 00 	movl   $0x36,0x4(%esp)
 8049fdb:	00 
 8049fdc:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 8049fe3:	e8 1b 0c 00 00       	call   804ac03 <debug_panic>
 8049fe8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049feb:	0f b6 10             	movzbl (%eax),%edx
 8049fee:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049ff1:	0f b6 00             	movzbl (%eax),%eax
 8049ff4:	38 c2                	cmp    %al,%dl
 8049ff6:	74 1e                	je     804a016 <memcmp+0xb0>
 8049ff8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049ffb:	0f b6 10             	movzbl (%eax),%edx
 8049ffe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a001:	0f b6 00             	movzbl (%eax),%eax
 804a004:	38 c2                	cmp    %al,%dl
 804a006:	76 07                	jbe    804a00f <memcmp+0xa9>
 804a008:	b8 01 00 00 00       	mov    $0x1,%eax
 804a00d:	eb 1f                	jmp    804a02e <memcmp+0xc8>
 804a00f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a014:	eb 18                	jmp    804a02e <memcmp+0xc8>
 804a016:	ff 45 f4             	incl   -0xc(%ebp)
 804a019:	ff 45 f0             	incl   -0x10(%ebp)
 804a01c:	8b 45 10             	mov    0x10(%ebp),%eax
 804a01f:	8d 50 ff             	lea    -0x1(%eax),%edx
 804a022:	89 55 10             	mov    %edx,0x10(%ebp)
 804a025:	85 c0                	test   %eax,%eax
 804a027:	75 bf                	jne    8049fe8 <memcmp+0x82>
 804a029:	b8 00 00 00 00       	mov    $0x0,%eax
 804a02e:	89 ec                	mov    %ebp,%esp
 804a030:	5d                   	pop    %ebp
 804a031:	c3                   	ret

0804a032 <strcmp>:
 804a032:	55                   	push   %ebp
 804a033:	89 e5                	mov    %esp,%ebp
 804a035:	83 ec 38             	sub    $0x38,%esp
 804a038:	8b 45 08             	mov    0x8(%ebp),%eax
 804a03b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a03e:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a041:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804a044:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a048:	75 2c                	jne    804a076 <strcmp+0x44>
 804a04a:	c7 44 24 10 b2 b8 04 	movl   $0x804b8b2,0x10(%esp)
 804a051:	08 
 804a052:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a059:	08 
 804a05a:	c7 44 24 08 50 b9 04 	movl   $0x804b950,0x8(%esp)
 804a061:	08 
 804a062:	c7 44 24 04 47 00 00 	movl   $0x47,0x4(%esp)
 804a069:	00 
 804a06a:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a071:	e8 8d 0b 00 00       	call   804ac03 <debug_panic>
 804a076:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 804a07a:	75 32                	jne    804a0ae <strcmp+0x7c>
 804a07c:	c7 44 24 10 bc b8 04 	movl   $0x804b8bc,0x10(%esp)
 804a083:	08 
 804a084:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a08b:	08 
 804a08c:	c7 44 24 08 50 b9 04 	movl   $0x804b950,0x8(%esp)
 804a093:	08 
 804a094:	c7 44 24 04 48 00 00 	movl   $0x48,0x4(%esp)
 804a09b:	00 
 804a09c:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a0a3:	e8 5b 0b 00 00       	call   804ac03 <debug_panic>
 804a0a8:	ff 45 f4             	incl   -0xc(%ebp)
 804a0ab:	ff 45 f0             	incl   -0x10(%ebp)
 804a0ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a0b1:	0f b6 00             	movzbl (%eax),%eax
 804a0b4:	84 c0                	test   %al,%al
 804a0b6:	74 10                	je     804a0c8 <strcmp+0x96>
 804a0b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a0bb:	0f b6 10             	movzbl (%eax),%edx
 804a0be:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a0c1:	0f b6 00             	movzbl (%eax),%eax
 804a0c4:	38 c2                	cmp    %al,%dl
 804a0c6:	74 e0                	je     804a0a8 <strcmp+0x76>
 804a0c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a0cb:	0f b6 10             	movzbl (%eax),%edx
 804a0ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a0d1:	0f b6 00             	movzbl (%eax),%eax
 804a0d4:	38 c2                	cmp    %al,%dl
 804a0d6:	72 16                	jb     804a0ee <strcmp+0xbc>
 804a0d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a0db:	0f b6 10             	movzbl (%eax),%edx
 804a0de:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a0e1:	0f b6 00             	movzbl (%eax),%eax
 804a0e4:	38 c2                	cmp    %al,%dl
 804a0e6:	0f 97 c0             	seta   %al
 804a0e9:	0f b6 c0             	movzbl %al,%eax
 804a0ec:	eb 05                	jmp    804a0f3 <strcmp+0xc1>
 804a0ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a0f3:	89 ec                	mov    %ebp,%esp
 804a0f5:	5d                   	pop    %ebp
 804a0f6:	c3                   	ret

0804a0f7 <memchr>:
 804a0f7:	55                   	push   %ebp
 804a0f8:	89 e5                	mov    %esp,%ebp
 804a0fa:	83 ec 38             	sub    $0x38,%esp
 804a0fd:	8b 45 08             	mov    0x8(%ebp),%eax
 804a100:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a103:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a106:	88 45 f3             	mov    %al,-0xd(%ebp)
 804a109:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a10d:	75 45                	jne    804a154 <memchr+0x5d>
 804a10f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804a113:	74 3f                	je     804a154 <memchr+0x5d>
 804a115:	c7 44 24 10 c6 b8 04 	movl   $0x804b8c6,0x10(%esp)
 804a11c:	08 
 804a11d:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a124:	08 
 804a125:	c7 44 24 08 58 b9 04 	movl   $0x804b958,0x8(%esp)
 804a12c:	08 
 804a12d:	c7 44 24 04 59 00 00 	movl   $0x59,0x4(%esp)
 804a134:	00 
 804a135:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a13c:	e8 c2 0a 00 00       	call   804ac03 <debug_panic>
 804a141:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a144:	0f b6 00             	movzbl (%eax),%eax
 804a147:	38 45 f3             	cmp    %al,-0xd(%ebp)
 804a14a:	75 05                	jne    804a151 <memchr+0x5a>
 804a14c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a14f:	eb 15                	jmp    804a166 <memchr+0x6f>
 804a151:	ff 45 f4             	incl   -0xc(%ebp)
 804a154:	8b 45 10             	mov    0x10(%ebp),%eax
 804a157:	8d 50 ff             	lea    -0x1(%eax),%edx
 804a15a:	89 55 10             	mov    %edx,0x10(%ebp)
 804a15d:	85 c0                	test   %eax,%eax
 804a15f:	75 e0                	jne    804a141 <memchr+0x4a>
 804a161:	b8 00 00 00 00       	mov    $0x0,%eax
 804a166:	89 ec                	mov    %ebp,%esp
 804a168:	5d                   	pop    %ebp
 804a169:	c3                   	ret

0804a16a <strchr>:
 804a16a:	55                   	push   %ebp
 804a16b:	89 e5                	mov    %esp,%ebp
 804a16d:	83 ec 38             	sub    $0x38,%esp
 804a170:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a173:	88 45 f7             	mov    %al,-0x9(%ebp)
 804a176:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804a17a:	75 2c                	jne    804a1a8 <strchr+0x3e>
 804a17c:	c7 44 24 10 e1 b8 04 	movl   $0x804b8e1,0x10(%esp)
 804a183:	08 
 804a184:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a18b:	08 
 804a18c:	c7 44 24 08 60 b9 04 	movl   $0x804b960,0x8(%esp)
 804a193:	08 
 804a194:	c7 44 24 04 69 00 00 	movl   $0x69,0x4(%esp)
 804a19b:	00 
 804a19c:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a1a3:	e8 5b 0a 00 00       	call   804ac03 <debug_panic>
 804a1a8:	8b 45 08             	mov    0x8(%ebp),%eax
 804a1ab:	0f b6 00             	movzbl (%eax),%eax
 804a1ae:	38 45 f7             	cmp    %al,-0x9(%ebp)
 804a1b1:	75 05                	jne    804a1b8 <strchr+0x4e>
 804a1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 804a1b6:	eb 16                	jmp    804a1ce <strchr+0x64>
 804a1b8:	8b 45 08             	mov    0x8(%ebp),%eax
 804a1bb:	0f b6 00             	movzbl (%eax),%eax
 804a1be:	84 c0                	test   %al,%al
 804a1c0:	75 07                	jne    804a1c9 <strchr+0x5f>
 804a1c2:	b8 00 00 00 00       	mov    $0x0,%eax
 804a1c7:	eb 05                	jmp    804a1ce <strchr+0x64>
 804a1c9:	ff 45 08             	incl   0x8(%ebp)
 804a1cc:	eb da                	jmp    804a1a8 <strchr+0x3e>
 804a1ce:	89 ec                	mov    %ebp,%esp
 804a1d0:	5d                   	pop    %ebp
 804a1d1:	c3                   	ret

0804a1d2 <strcspn>:
 804a1d2:	55                   	push   %ebp
 804a1d3:	89 e5                	mov    %esp,%ebp
 804a1d5:	83 ec 28             	sub    $0x28,%esp
 804a1d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804a1df:	eb 24                	jmp    804a205 <strcspn+0x33>
 804a1e1:	8b 55 08             	mov    0x8(%ebp),%edx
 804a1e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a1e7:	01 d0                	add    %edx,%eax
 804a1e9:	0f b6 00             	movzbl (%eax),%eax
 804a1ec:	0f be c0             	movsbl %al,%eax
 804a1ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a1f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a1f6:	89 04 24             	mov    %eax,(%esp)
 804a1f9:	e8 6c ff ff ff       	call   804a16a <strchr>
 804a1fe:	85 c0                	test   %eax,%eax
 804a200:	75 14                	jne    804a216 <strcspn+0x44>
 804a202:	ff 45 f4             	incl   -0xc(%ebp)
 804a205:	8b 55 08             	mov    0x8(%ebp),%edx
 804a208:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a20b:	01 d0                	add    %edx,%eax
 804a20d:	0f b6 00             	movzbl (%eax),%eax
 804a210:	84 c0                	test   %al,%al
 804a212:	75 cd                	jne    804a1e1 <strcspn+0xf>
 804a214:	eb 01                	jmp    804a217 <strcspn+0x45>
 804a216:	90                   	nop
 804a217:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a21a:	89 ec                	mov    %ebp,%esp
 804a21c:	5d                   	pop    %ebp
 804a21d:	c3                   	ret

0804a21e <strpbrk>:
 804a21e:	55                   	push   %ebp
 804a21f:	89 e5                	mov    %esp,%ebp
 804a221:	83 ec 18             	sub    $0x18,%esp
 804a224:	eb 24                	jmp    804a24a <strpbrk+0x2c>
 804a226:	8b 45 08             	mov    0x8(%ebp),%eax
 804a229:	0f b6 00             	movzbl (%eax),%eax
 804a22c:	0f be c0             	movsbl %al,%eax
 804a22f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a233:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a236:	89 04 24             	mov    %eax,(%esp)
 804a239:	e8 2c ff ff ff       	call   804a16a <strchr>
 804a23e:	85 c0                	test   %eax,%eax
 804a240:	74 05                	je     804a247 <strpbrk+0x29>
 804a242:	8b 45 08             	mov    0x8(%ebp),%eax
 804a245:	eb 12                	jmp    804a259 <strpbrk+0x3b>
 804a247:	ff 45 08             	incl   0x8(%ebp)
 804a24a:	8b 45 08             	mov    0x8(%ebp),%eax
 804a24d:	0f b6 00             	movzbl (%eax),%eax
 804a250:	84 c0                	test   %al,%al
 804a252:	75 d2                	jne    804a226 <strpbrk+0x8>
 804a254:	b8 00 00 00 00       	mov    $0x0,%eax
 804a259:	89 ec                	mov    %ebp,%esp
 804a25b:	5d                   	pop    %ebp
 804a25c:	c3                   	ret

0804a25d <strrchr>:
 804a25d:	55                   	push   %ebp
 804a25e:	89 e5                	mov    %esp,%ebp
 804a260:	83 ec 10             	sub    $0x10,%esp
 804a263:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a266:	88 45 fb             	mov    %al,-0x5(%ebp)
 804a269:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804a270:	eb 14                	jmp    804a286 <strrchr+0x29>
 804a272:	8b 45 08             	mov    0x8(%ebp),%eax
 804a275:	0f b6 00             	movzbl (%eax),%eax
 804a278:	38 45 fb             	cmp    %al,-0x5(%ebp)
 804a27b:	75 06                	jne    804a283 <strrchr+0x26>
 804a27d:	8b 45 08             	mov    0x8(%ebp),%eax
 804a280:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804a283:	ff 45 08             	incl   0x8(%ebp)
 804a286:	8b 45 08             	mov    0x8(%ebp),%eax
 804a289:	0f b6 00             	movzbl (%eax),%eax
 804a28c:	84 c0                	test   %al,%al
 804a28e:	75 e2                	jne    804a272 <strrchr+0x15>
 804a290:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804a293:	89 ec                	mov    %ebp,%esp
 804a295:	5d                   	pop    %ebp
 804a296:	c3                   	ret

0804a297 <strspn>:
 804a297:	55                   	push   %ebp
 804a298:	89 e5                	mov    %esp,%ebp
 804a29a:	83 ec 28             	sub    $0x28,%esp
 804a29d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804a2a4:	eb 24                	jmp    804a2ca <strspn+0x33>
 804a2a6:	8b 55 08             	mov    0x8(%ebp),%edx
 804a2a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a2ac:	01 d0                	add    %edx,%eax
 804a2ae:	0f b6 00             	movzbl (%eax),%eax
 804a2b1:	0f be c0             	movsbl %al,%eax
 804a2b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a2b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a2bb:	89 04 24             	mov    %eax,(%esp)
 804a2be:	e8 a7 fe ff ff       	call   804a16a <strchr>
 804a2c3:	85 c0                	test   %eax,%eax
 804a2c5:	74 14                	je     804a2db <strspn+0x44>
 804a2c7:	ff 45 f4             	incl   -0xc(%ebp)
 804a2ca:	8b 55 08             	mov    0x8(%ebp),%edx
 804a2cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a2d0:	01 d0                	add    %edx,%eax
 804a2d2:	0f b6 00             	movzbl (%eax),%eax
 804a2d5:	84 c0                	test   %al,%al
 804a2d7:	75 cd                	jne    804a2a6 <strspn+0xf>
 804a2d9:	eb 01                	jmp    804a2dc <strspn+0x45>
 804a2db:	90                   	nop
 804a2dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a2df:	89 ec                	mov    %ebp,%esp
 804a2e1:	5d                   	pop    %ebp
 804a2e2:	c3                   	ret

0804a2e3 <strstr>:
 804a2e3:	55                   	push   %ebp
 804a2e4:	89 e5                	mov    %esp,%ebp
 804a2e6:	83 ec 28             	sub    $0x28,%esp
 804a2e9:	8b 45 08             	mov    0x8(%ebp),%eax
 804a2ec:	89 04 24             	mov    %eax,(%esp)
 804a2ef:	e8 00 02 00 00       	call   804a4f4 <strlen>
 804a2f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804a2f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a2fa:	89 04 24             	mov    %eax,(%esp)
 804a2fd:	e8 f2 01 00 00       	call   804a4f4 <strlen>
 804a302:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804a305:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a308:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 804a30b:	72 43                	jb     804a350 <strstr+0x6d>
 804a30d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804a314:	eb 2f                	jmp    804a345 <strstr+0x62>
 804a316:	8b 55 08             	mov    0x8(%ebp),%edx
 804a319:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a31c:	01 c2                	add    %eax,%edx
 804a31e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a321:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a325:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a328:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a32c:	89 14 24             	mov    %edx,(%esp)
 804a32f:	e8 32 fc ff ff       	call   8049f66 <memcmp>
 804a334:	85 c0                	test   %eax,%eax
 804a336:	75 0a                	jne    804a342 <strstr+0x5f>
 804a338:	8b 55 08             	mov    0x8(%ebp),%edx
 804a33b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a33e:	01 d0                	add    %edx,%eax
 804a340:	eb 13                	jmp    804a355 <strstr+0x72>
 804a342:	ff 45 f4             	incl   -0xc(%ebp)
 804a345:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a348:	2b 45 ec             	sub    -0x14(%ebp),%eax
 804a34b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 804a34e:	76 c6                	jbe    804a316 <strstr+0x33>
 804a350:	b8 00 00 00 00       	mov    $0x0,%eax
 804a355:	89 ec                	mov    %ebp,%esp
 804a357:	5d                   	pop    %ebp
 804a358:	c3                   	ret

0804a359 <strtok_r>:
 804a359:	55                   	push   %ebp
 804a35a:	89 e5                	mov    %esp,%ebp
 804a35c:	83 ec 38             	sub    $0x38,%esp
 804a35f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804a363:	75 2c                	jne    804a391 <strtok_r+0x38>
 804a365:	c7 44 24 10 f0 b8 04 	movl   $0x804b8f0,0x10(%esp)
 804a36c:	08 
 804a36d:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a374:	08 
 804a375:	c7 44 24 08 68 b9 04 	movl   $0x804b968,0x8(%esp)
 804a37c:	08 
 804a37d:	c7 44 24 04 d6 00 00 	movl   $0xd6,0x4(%esp)
 804a384:	00 
 804a385:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a38c:	e8 72 08 00 00       	call   804ac03 <debug_panic>
 804a391:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804a395:	75 2c                	jne    804a3c3 <strtok_r+0x6a>
 804a397:	c7 44 24 10 03 b9 04 	movl   $0x804b903,0x10(%esp)
 804a39e:	08 
 804a39f:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a3a6:	08 
 804a3a7:	c7 44 24 08 68 b9 04 	movl   $0x804b968,0x8(%esp)
 804a3ae:	08 
 804a3af:	c7 44 24 04 d7 00 00 	movl   $0xd7,0x4(%esp)
 804a3b6:	00 
 804a3b7:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a3be:	e8 40 08 00 00       	call   804ac03 <debug_panic>
 804a3c3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804a3c7:	75 08                	jne    804a3d1 <strtok_r+0x78>
 804a3c9:	8b 45 10             	mov    0x10(%ebp),%eax
 804a3cc:	8b 00                	mov    (%eax),%eax
 804a3ce:	89 45 08             	mov    %eax,0x8(%ebp)
 804a3d1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804a3d5:	75 48                	jne    804a41f <strtok_r+0xc6>
 804a3d7:	c7 44 24 10 14 b9 04 	movl   $0x804b914,0x10(%esp)
 804a3de:	08 
 804a3df:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a3e6:	08 
 804a3e7:	c7 44 24 08 68 b9 04 	movl   $0x804b968,0x8(%esp)
 804a3ee:	08 
 804a3ef:	c7 44 24 04 dd 00 00 	movl   $0xdd,0x4(%esp)
 804a3f6:	00 
 804a3f7:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a3fe:	e8 00 08 00 00       	call   804ac03 <debug_panic>
 804a403:	8b 45 08             	mov    0x8(%ebp),%eax
 804a406:	0f b6 00             	movzbl (%eax),%eax
 804a409:	84 c0                	test   %al,%al
 804a40b:	75 0f                	jne    804a41c <strtok_r+0xc3>
 804a40d:	8b 45 10             	mov    0x10(%ebp),%eax
 804a410:	8b 55 08             	mov    0x8(%ebp),%edx
 804a413:	89 10                	mov    %edx,(%eax)
 804a415:	b8 00 00 00 00       	mov    $0x0,%eax
 804a41a:	eb 6e                	jmp    804a48a <strtok_r+0x131>
 804a41c:	ff 45 08             	incl   0x8(%ebp)
 804a41f:	8b 45 08             	mov    0x8(%ebp),%eax
 804a422:	0f b6 00             	movzbl (%eax),%eax
 804a425:	0f be c0             	movsbl %al,%eax
 804a428:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a42c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a42f:	89 04 24             	mov    %eax,(%esp)
 804a432:	e8 33 fd ff ff       	call   804a16a <strchr>
 804a437:	85 c0                	test   %eax,%eax
 804a439:	75 c8                	jne    804a403 <strtok_r+0xaa>
 804a43b:	8b 45 08             	mov    0x8(%ebp),%eax
 804a43e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a441:	eb 03                	jmp    804a446 <strtok_r+0xed>
 804a443:	ff 45 08             	incl   0x8(%ebp)
 804a446:	8b 45 08             	mov    0x8(%ebp),%eax
 804a449:	0f b6 00             	movzbl (%eax),%eax
 804a44c:	0f be c0             	movsbl %al,%eax
 804a44f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a453:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a456:	89 04 24             	mov    %eax,(%esp)
 804a459:	e8 0c fd ff ff       	call   804a16a <strchr>
 804a45e:	85 c0                	test   %eax,%eax
 804a460:	74 e1                	je     804a443 <strtok_r+0xea>
 804a462:	8b 45 08             	mov    0x8(%ebp),%eax
 804a465:	0f b6 00             	movzbl (%eax),%eax
 804a468:	84 c0                	test   %al,%al
 804a46a:	74 13                	je     804a47f <strtok_r+0x126>
 804a46c:	8b 45 08             	mov    0x8(%ebp),%eax
 804a46f:	c6 00 00             	movb   $0x0,(%eax)
 804a472:	8b 45 08             	mov    0x8(%ebp),%eax
 804a475:	8d 50 01             	lea    0x1(%eax),%edx
 804a478:	8b 45 10             	mov    0x10(%ebp),%eax
 804a47b:	89 10                	mov    %edx,(%eax)
 804a47d:	eb 08                	jmp    804a487 <strtok_r+0x12e>
 804a47f:	8b 45 10             	mov    0x10(%ebp),%eax
 804a482:	8b 55 08             	mov    0x8(%ebp),%edx
 804a485:	89 10                	mov    %edx,(%eax)
 804a487:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a48a:	89 ec                	mov    %ebp,%esp
 804a48c:	5d                   	pop    %ebp
 804a48d:	c3                   	ret

0804a48e <memset>:
 804a48e:	55                   	push   %ebp
 804a48f:	89 e5                	mov    %esp,%ebp
 804a491:	83 ec 38             	sub    $0x38,%esp
 804a494:	8b 45 08             	mov    0x8(%ebp),%eax
 804a497:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a49a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804a49e:	75 40                	jne    804a4e0 <memset+0x52>
 804a4a0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804a4a4:	74 3a                	je     804a4e0 <memset+0x52>
 804a4a6:	c7 44 24 10 28 b8 04 	movl   $0x804b828,0x10(%esp)
 804a4ad:	08 
 804a4ae:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a4b5:	08 
 804a4b6:	c7 44 24 08 74 b9 04 	movl   $0x804b974,0x8(%esp)
 804a4bd:	08 
 804a4be:	c7 44 24 04 fc 00 00 	movl   $0xfc,0x4(%esp)
 804a4c5:	00 
 804a4c6:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a4cd:	e8 31 07 00 00       	call   804ac03 <debug_panic>
 804a4d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a4d5:	8d 50 01             	lea    0x1(%eax),%edx
 804a4d8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804a4db:	8b 55 0c             	mov    0xc(%ebp),%edx
 804a4de:	88 10                	mov    %dl,(%eax)
 804a4e0:	8b 45 10             	mov    0x10(%ebp),%eax
 804a4e3:	8d 50 ff             	lea    -0x1(%eax),%edx
 804a4e6:	89 55 10             	mov    %edx,0x10(%ebp)
 804a4e9:	85 c0                	test   %eax,%eax
 804a4eb:	75 e5                	jne    804a4d2 <memset+0x44>
 804a4ed:	8b 45 08             	mov    0x8(%ebp),%eax
 804a4f0:	89 ec                	mov    %ebp,%esp
 804a4f2:	5d                   	pop    %ebp
 804a4f3:	c3                   	ret

0804a4f4 <strlen>:
 804a4f4:	55                   	push   %ebp
 804a4f5:	89 e5                	mov    %esp,%ebp
 804a4f7:	83 ec 38             	sub    $0x38,%esp
 804a4fa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804a4fe:	75 2c                	jne    804a52c <strlen+0x38>
 804a500:	c7 44 24 10 e1 b8 04 	movl   $0x804b8e1,0x10(%esp)
 804a507:	08 
 804a508:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a50f:	08 
 804a510:	c7 44 24 08 7c b9 04 	movl   $0x804b97c,0x8(%esp)
 804a517:	08 
 804a518:	c7 44 24 04 08 01 00 	movl   $0x108,0x4(%esp)
 804a51f:	00 
 804a520:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a527:	e8 d7 06 00 00       	call   804ac03 <debug_panic>
 804a52c:	8b 45 08             	mov    0x8(%ebp),%eax
 804a52f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a532:	eb 04                	jmp    804a538 <strlen+0x44>
 804a534:	90                   	nop
 804a535:	ff 45 f4             	incl   -0xc(%ebp)
 804a538:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a53b:	0f b6 00             	movzbl (%eax),%eax
 804a53e:	84 c0                	test   %al,%al
 804a540:	75 f2                	jne    804a534 <strlen+0x40>
 804a542:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a545:	2b 45 08             	sub    0x8(%ebp),%eax
 804a548:	89 ec                	mov    %ebp,%esp
 804a54a:	5d                   	pop    %ebp
 804a54b:	c3                   	ret

0804a54c <strnlen>:
 804a54c:	55                   	push   %ebp
 804a54d:	89 e5                	mov    %esp,%ebp
 804a54f:	83 ec 10             	sub    $0x10,%esp
 804a552:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804a559:	eb 04                	jmp    804a55f <strnlen+0x13>
 804a55b:	90                   	nop
 804a55c:	ff 45 fc             	incl   -0x4(%ebp)
 804a55f:	8b 55 08             	mov    0x8(%ebp),%edx
 804a562:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804a565:	01 d0                	add    %edx,%eax
 804a567:	0f b6 00             	movzbl (%eax),%eax
 804a56a:	84 c0                	test   %al,%al
 804a56c:	74 08                	je     804a576 <strnlen+0x2a>
 804a56e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804a571:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804a574:	72 e5                	jb     804a55b <strnlen+0xf>
 804a576:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804a579:	89 ec                	mov    %ebp,%esp
 804a57b:	5d                   	pop    %ebp
 804a57c:	c3                   	ret

0804a57d <strlcpy>:
 804a57d:	55                   	push   %ebp
 804a57e:	89 e5                	mov    %esp,%ebp
 804a580:	83 ec 38             	sub    $0x38,%esp
 804a583:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804a587:	75 2c                	jne    804a5b5 <strlcpy+0x38>
 804a589:	c7 44 24 10 1e b9 04 	movl   $0x804b91e,0x10(%esp)
 804a590:	08 
 804a591:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a598:	08 
 804a599:	c7 44 24 08 84 b9 04 	movl   $0x804b984,0x8(%esp)
 804a5a0:	08 
 804a5a1:	c7 44 24 04 25 01 00 	movl   $0x125,0x4(%esp)
 804a5a8:	00 
 804a5a9:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a5b0:	e8 4e 06 00 00       	call   804ac03 <debug_panic>
 804a5b5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804a5b9:	75 2c                	jne    804a5e7 <strlcpy+0x6a>
 804a5bb:	c7 44 24 10 2a b9 04 	movl   $0x804b92a,0x10(%esp)
 804a5c2:	08 
 804a5c3:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a5ca:	08 
 804a5cb:	c7 44 24 08 84 b9 04 	movl   $0x804b984,0x8(%esp)
 804a5d2:	08 
 804a5d3:	c7 44 24 04 26 01 00 	movl   $0x126,0x4(%esp)
 804a5da:	00 
 804a5db:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a5e2:	e8 1c 06 00 00       	call   804ac03 <debug_panic>
 804a5e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a5ea:	89 04 24             	mov    %eax,(%esp)
 804a5ed:	e8 02 ff ff ff       	call   804a4f4 <strlen>
 804a5f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804a5f5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804a5f9:	74 39                	je     804a634 <strlcpy+0xb7>
 804a5fb:	8b 45 10             	mov    0x10(%ebp),%eax
 804a5fe:	48                   	dec    %eax
 804a5ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a602:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a605:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804a608:	73 06                	jae    804a610 <strlcpy+0x93>
 804a60a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a60d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a610:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a613:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a617:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a61a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a61e:	8b 45 08             	mov    0x8(%ebp),%eax
 804a621:	89 04 24             	mov    %eax,(%esp)
 804a624:	e8 ab f7 ff ff       	call   8049dd4 <memcpy>
 804a629:	8b 55 08             	mov    0x8(%ebp),%edx
 804a62c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a62f:	01 d0                	add    %edx,%eax
 804a631:	c6 00 00             	movb   $0x0,(%eax)
 804a634:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a637:	89 ec                	mov    %ebp,%esp
 804a639:	5d                   	pop    %ebp
 804a63a:	c3                   	ret

0804a63b <strlcat>:
 804a63b:	55                   	push   %ebp
 804a63c:	89 e5                	mov    %esp,%ebp
 804a63e:	83 ec 38             	sub    $0x38,%esp
 804a641:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804a645:	75 2c                	jne    804a673 <strlcat+0x38>
 804a647:	c7 44 24 10 1e b9 04 	movl   $0x804b91e,0x10(%esp)
 804a64e:	08 
 804a64f:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a656:	08 
 804a657:	c7 44 24 08 8c b9 04 	movl   $0x804b98c,0x8(%esp)
 804a65e:	08 
 804a65f:	c7 44 24 04 40 01 00 	movl   $0x140,0x4(%esp)
 804a666:	00 
 804a667:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a66e:	e8 90 05 00 00       	call   804ac03 <debug_panic>
 804a673:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804a677:	75 2c                	jne    804a6a5 <strlcat+0x6a>
 804a679:	c7 44 24 10 2a b9 04 	movl   $0x804b92a,0x10(%esp)
 804a680:	08 
 804a681:	c7 44 24 0c 41 b8 04 	movl   $0x804b841,0xc(%esp)
 804a688:	08 
 804a689:	c7 44 24 08 8c b9 04 	movl   $0x804b98c,0x8(%esp)
 804a690:	08 
 804a691:	c7 44 24 04 41 01 00 	movl   $0x141,0x4(%esp)
 804a698:	00 
 804a699:	c7 04 24 58 b8 04 08 	movl   $0x804b858,(%esp)
 804a6a0:	e8 5e 05 00 00       	call   804ac03 <debug_panic>
 804a6a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a6a8:	89 04 24             	mov    %eax,(%esp)
 804a6ab:	e8 44 fe ff ff       	call   804a4f4 <strlen>
 804a6b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804a6b3:	8b 45 08             	mov    0x8(%ebp),%eax
 804a6b6:	89 04 24             	mov    %eax,(%esp)
 804a6b9:	e8 36 fe ff ff       	call   804a4f4 <strlen>
 804a6be:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804a6c1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804a6c5:	74 4e                	je     804a715 <strlcat+0xda>
 804a6c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a6ca:	3b 45 10             	cmp    0x10(%ebp),%eax
 804a6cd:	73 46                	jae    804a715 <strlcat+0xda>
 804a6cf:	8b 45 10             	mov    0x10(%ebp),%eax
 804a6d2:	2b 45 ec             	sub    -0x14(%ebp),%eax
 804a6d5:	48                   	dec    %eax
 804a6d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a6d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a6dc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804a6df:	73 06                	jae    804a6e7 <strlcat+0xac>
 804a6e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a6e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a6e7:	8b 55 08             	mov    0x8(%ebp),%edx
 804a6ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a6ed:	01 c2                	add    %eax,%edx
 804a6ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a6f2:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a6f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a6f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a6fd:	89 14 24             	mov    %edx,(%esp)
 804a700:	e8 cf f6 ff ff       	call   8049dd4 <memcpy>
 804a705:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804a708:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a70b:	01 c2                	add    %eax,%edx
 804a70d:	8b 45 08             	mov    0x8(%ebp),%eax
 804a710:	01 d0                	add    %edx,%eax
 804a712:	c6 00 00             	movb   $0x0,(%eax)
 804a715:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804a718:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a71b:	01 d0                	add    %edx,%eax
 804a71d:	89 ec                	mov    %ebp,%esp
 804a71f:	5d                   	pop    %ebp
 804a720:	c3                   	ret

0804a721 <divl>:
 804a721:	55                   	push   %ebp
 804a722:	89 e5                	mov    %esp,%ebp
 804a724:	83 ec 18             	sub    $0x18,%esp
 804a727:	8b 45 08             	mov    0x8(%ebp),%eax
 804a72a:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804a72d:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a730:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804a733:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a736:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804a739:	89 d0                	mov    %edx,%eax
 804a73b:	31 d2                	xor    %edx,%edx
 804a73d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804a740:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a743:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804a746:	8b 55 fc             	mov    -0x4(%ebp),%edx
 804a749:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804a74c:	f7 75 10             	divl   0x10(%ebp)
 804a74f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804a752:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804a755:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a758:	89 ec                	mov    %ebp,%esp
 804a75a:	5d                   	pop    %ebp
 804a75b:	c3                   	ret

0804a75c <nlz>:
 804a75c:	55                   	push   %ebp
 804a75d:	89 e5                	mov    %esp,%ebp
 804a75f:	83 ec 10             	sub    $0x10,%esp
 804a762:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804a769:	81 7d 08 ff ff 00 00 	cmpl   $0xffff,0x8(%ebp)
 804a770:	77 08                	ja     804a77a <nlz+0x1e>
 804a772:	83 45 fc 10          	addl   $0x10,-0x4(%ebp)
 804a776:	c1 65 08 10          	shll   $0x10,0x8(%ebp)
 804a77a:	81 7d 08 ff ff ff 00 	cmpl   $0xffffff,0x8(%ebp)
 804a781:	77 08                	ja     804a78b <nlz+0x2f>
 804a783:	83 45 fc 08          	addl   $0x8,-0x4(%ebp)
 804a787:	c1 65 08 08          	shll   $0x8,0x8(%ebp)
 804a78b:	81 7d 08 ff ff ff 0f 	cmpl   $0xfffffff,0x8(%ebp)
 804a792:	77 08                	ja     804a79c <nlz+0x40>
 804a794:	83 45 fc 04          	addl   $0x4,-0x4(%ebp)
 804a798:	c1 65 08 04          	shll   $0x4,0x8(%ebp)
 804a79c:	81 7d 08 ff ff ff 3f 	cmpl   $0x3fffffff,0x8(%ebp)
 804a7a3:	77 08                	ja     804a7ad <nlz+0x51>
 804a7a5:	83 45 fc 02          	addl   $0x2,-0x4(%ebp)
 804a7a9:	c1 65 08 02          	shll   $0x2,0x8(%ebp)
 804a7ad:	8b 45 08             	mov    0x8(%ebp),%eax
 804a7b0:	85 c0                	test   %eax,%eax
 804a7b2:	78 03                	js     804a7b7 <nlz+0x5b>
 804a7b4:	ff 45 fc             	incl   -0x4(%ebp)
 804a7b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804a7ba:	89 ec                	mov    %ebp,%esp
 804a7bc:	5d                   	pop    %ebp
 804a7bd:	c3                   	ret

0804a7be <udiv64>:
 804a7be:	55                   	push   %ebp
 804a7bf:	89 e5                	mov    %esp,%ebp
 804a7c1:	57                   	push   %edi
 804a7c2:	56                   	push   %esi
 804a7c3:	53                   	push   %ebx
 804a7c4:	83 ec 54             	sub    $0x54,%esp
 804a7c7:	8b 45 08             	mov    0x8(%ebp),%eax
 804a7ca:	89 45 b8             	mov    %eax,-0x48(%ebp)
 804a7cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a7d0:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804a7d3:	8b 45 10             	mov    0x10(%ebp),%eax
 804a7d6:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804a7d9:	8b 45 14             	mov    0x14(%ebp),%eax
 804a7dc:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804a7df:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a7e2:	8b 55 b4             	mov    -0x4c(%ebp),%edx
 804a7e5:	89 d0                	mov    %edx,%eax
 804a7e7:	31 d2                	xor    %edx,%edx
 804a7e9:	89 c7                	mov    %eax,%edi
 804a7eb:	83 f7 00             	xor    $0x0,%edi
 804a7ee:	89 f9                	mov    %edi,%ecx
 804a7f0:	89 d0                	mov    %edx,%eax
 804a7f2:	83 f0 00             	xor    $0x0,%eax
 804a7f5:	89 c3                	mov    %eax,%ebx
 804a7f7:	89 d8                	mov    %ebx,%eax
 804a7f9:	09 c8                	or     %ecx,%eax
 804a7fb:	85 c0                	test   %eax,%eax
 804a7fd:	0f 85 a6 00 00 00    	jne    804a8a9 <udiv64+0xeb>
 804a803:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 804a80a:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
 804a811:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804a814:	8b 55 bc             	mov    -0x44(%ebp),%edx
 804a817:	89 d0                	mov    %edx,%eax
 804a819:	31 d2                	xor    %edx,%edx
 804a81b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804a81e:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804a821:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804a824:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a827:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804a82a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804a82d:	ba 00 00 00 00       	mov    $0x0,%edx
 804a832:	f7 75 cc             	divl   -0x34(%ebp)
 804a835:	89 d0                	mov    %edx,%eax
 804a837:	ba 00 00 00 00       	mov    $0x0,%edx
 804a83c:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 804a83f:	89 cb                	mov    %ecx,%ebx
 804a841:	0f af da             	imul   %edx,%ebx
 804a844:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 804a847:	0f af c8             	imul   %eax,%ecx
 804a84a:	01 d9                	add    %ebx,%ecx
 804a84c:	f7 65 d8             	mull   -0x28(%ebp)
 804a84f:	01 d1                	add    %edx,%ecx
 804a851:	89 ca                	mov    %ecx,%edx
 804a853:	8b 4d d0             	mov    -0x30(%ebp),%ecx
 804a856:	bb 00 00 00 00       	mov    $0x0,%ebx
 804a85b:	01 c8                	add    %ecx,%eax
 804a85d:	11 da                	adc    %ebx,%edx
 804a85f:	8b 4d cc             	mov    -0x34(%ebp),%ecx
 804a862:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804a866:	89 04 24             	mov    %eax,(%esp)
 804a869:	89 54 24 04          	mov    %edx,0x4(%esp)
 804a86d:	e8 af fe ff ff       	call   804a721 <divl>
 804a872:	89 c6                	mov    %eax,%esi
 804a874:	bf 00 00 00 00       	mov    $0x0,%edi
 804a879:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804a87c:	ba 00 00 00 00       	mov    $0x0,%edx
 804a881:	f7 75 cc             	divl   -0x34(%ebp)
 804a884:	ba 00 00 00 00       	mov    $0x0,%edx
 804a889:	8b 4d d8             	mov    -0x28(%ebp),%ecx
 804a88c:	89 cb                	mov    %ecx,%ebx
 804a88e:	0f af da             	imul   %edx,%ebx
 804a891:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 804a894:	0f af c8             	imul   %eax,%ecx
 804a897:	01 d9                	add    %ebx,%ecx
 804a899:	f7 65 d8             	mull   -0x28(%ebp)
 804a89c:	01 d1                	add    %edx,%ecx
 804a89e:	89 ca                	mov    %ecx,%edx
 804a8a0:	01 f0                	add    %esi,%eax
 804a8a2:	11 fa                	adc    %edi,%edx
 804a8a4:	e9 de 00 00 00       	jmp    804a987 <udiv64+0x1c9>
 804a8a9:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804a8ac:	8b 55 bc             	mov    -0x44(%ebp),%edx
 804a8af:	3b 45 b0             	cmp    -0x50(%ebp),%eax
 804a8b2:	89 d0                	mov    %edx,%eax
 804a8b4:	1b 45 b4             	sbb    -0x4c(%ebp),%eax
 804a8b7:	73 0f                	jae    804a8c8 <udiv64+0x10a>
 804a8b9:	b8 00 00 00 00       	mov    $0x0,%eax
 804a8be:	ba 00 00 00 00       	mov    $0x0,%edx
 804a8c3:	e9 bf 00 00 00       	jmp    804a987 <udiv64+0x1c9>
 804a8c8:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a8cb:	8b 55 b4             	mov    -0x4c(%ebp),%edx
 804a8ce:	89 d0                	mov    %edx,%eax
 804a8d0:	31 d2                	xor    %edx,%edx
 804a8d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804a8d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a8d8:	89 04 24             	mov    %eax,(%esp)
 804a8db:	e8 7c fe ff ff       	call   804a75c <nlz>
 804a8e0:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804a8e3:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 804a8e6:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a8e9:	8b 55 b4             	mov    -0x4c(%ebp),%edx
 804a8ec:	0f a5 c2             	shld   %cl,%eax,%edx
 804a8ef:	d3 e0                	shl    %cl,%eax
 804a8f1:	f6 c1 20             	test   $0x20,%cl
 804a8f4:	74 04                	je     804a8fa <udiv64+0x13c>
 804a8f6:	89 c2                	mov    %eax,%edx
 804a8f8:	31 c0                	xor    %eax,%eax
 804a8fa:	89 d0                	mov    %edx,%eax
 804a8fc:	31 d2                	xor    %edx,%edx
 804a8fe:	89 c1                	mov    %eax,%ecx
 804a900:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804a903:	8b 55 bc             	mov    -0x44(%ebp),%edx
 804a906:	0f ac d0 01          	shrd   $0x1,%edx,%eax
 804a90a:	d1 ea                	shr    $1,%edx
 804a90c:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804a910:	89 04 24             	mov    %eax,(%esp)
 804a913:	89 54 24 04          	mov    %edx,0x4(%esp)
 804a917:	e8 05 fe ff ff       	call   804a721 <divl>
 804a91c:	89 c2                	mov    %eax,%edx
 804a91e:	b8 1f 00 00 00       	mov    $0x1f,%eax
 804a923:	2b 45 e8             	sub    -0x18(%ebp),%eax
 804a926:	88 c1                	mov    %al,%cl
 804a928:	d3 ea                	shr    %cl,%edx
 804a92a:	89 d0                	mov    %edx,%eax
 804a92c:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804a92f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 804a936:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a939:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804a93c:	83 c0 ff             	add    $0xffffffff,%eax
 804a93f:	83 d2 ff             	adc    $0xffffffff,%edx
 804a942:	8b 4d b0             	mov    -0x50(%ebp),%ecx
 804a945:	89 cb                	mov    %ecx,%ebx
 804a947:	0f af da             	imul   %edx,%ebx
 804a94a:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
 804a94d:	0f af c8             	imul   %eax,%ecx
 804a950:	8d 34 0b             	lea    (%ebx,%ecx,1),%esi
 804a953:	f7 65 b0             	mull   -0x50(%ebp)
 804a956:	89 c1                	mov    %eax,%ecx
 804a958:	89 d3                	mov    %edx,%ebx
 804a95a:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
 804a95d:	89 c3                	mov    %eax,%ebx
 804a95f:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804a962:	8b 55 bc             	mov    -0x44(%ebp),%edx
 804a965:	29 c8                	sub    %ecx,%eax
 804a967:	19 da                	sbb    %ebx,%edx
 804a969:	3b 45 b0             	cmp    -0x50(%ebp),%eax
 804a96c:	89 d0                	mov    %edx,%eax
 804a96e:	1b 45 b4             	sbb    -0x4c(%ebp),%eax
 804a971:	73 0e                	jae    804a981 <udiv64+0x1c3>
 804a973:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a976:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804a979:	83 c0 ff             	add    $0xffffffff,%eax
 804a97c:	83 d2 ff             	adc    $0xffffffff,%edx
 804a97f:	eb 06                	jmp    804a987 <udiv64+0x1c9>
 804a981:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a984:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804a987:	83 c4 54             	add    $0x54,%esp
 804a98a:	5b                   	pop    %ebx
 804a98b:	5e                   	pop    %esi
 804a98c:	5f                   	pop    %edi
 804a98d:	5d                   	pop    %ebp
 804a98e:	c3                   	ret

0804a98f <umod64>:
 804a98f:	55                   	push   %ebp
 804a990:	89 e5                	mov    %esp,%ebp
 804a992:	83 ec 28             	sub    $0x28,%esp
 804a995:	89 5d fc             	mov    %ebx,-0x4(%ebp)
 804a998:	8b 45 08             	mov    0x8(%ebp),%eax
 804a99b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804a99e:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a9a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a9a4:	8b 45 10             	mov    0x10(%ebp),%eax
 804a9a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804a9aa:	8b 45 14             	mov    0x14(%ebp),%eax
 804a9ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804a9b0:	8b 5d f0             	mov    -0x10(%ebp),%ebx
 804a9b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a9b6:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804a9b9:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a9bd:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804a9c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a9c4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804a9c7:	89 04 24             	mov    %eax,(%esp)
 804a9ca:	89 54 24 04          	mov    %edx,0x4(%esp)
 804a9ce:	e8 eb fd ff ff       	call   804a7be <udiv64>
 804a9d3:	89 c2                	mov    %eax,%edx
 804a9d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a9d8:	0f af d0             	imul   %eax,%edx
 804a9db:	89 d8                	mov    %ebx,%eax
 804a9dd:	29 d0                	sub    %edx,%eax
 804a9df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 804a9e2:	89 ec                	mov    %ebp,%esp
 804a9e4:	5d                   	pop    %ebp
 804a9e5:	c3                   	ret

0804a9e6 <sdiv64>:
 804a9e6:	55                   	push   %ebp
 804a9e7:	89 e5                	mov    %esp,%ebp
 804a9e9:	57                   	push   %edi
 804a9ea:	56                   	push   %esi
 804a9eb:	83 ec 40             	sub    $0x40,%esp
 804a9ee:	8b 45 08             	mov    0x8(%ebp),%eax
 804a9f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804a9f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a9f7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804a9fa:	8b 45 10             	mov    0x10(%ebp),%eax
 804a9fd:	89 45 c8             	mov    %eax,-0x38(%ebp)
 804aa00:	8b 45 14             	mov    0x14(%ebp),%eax
 804aa03:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804aa06:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 804aa0a:	79 0f                	jns    804aa1b <sdiv64+0x35>
 804aa0c:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804aa0f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804aa12:	f7 d8                	neg    %eax
 804aa14:	83 d2 00             	adc    $0x0,%edx
 804aa17:	f7 da                	neg    %edx
 804aa19:	eb 06                	jmp    804aa21 <sdiv64+0x3b>
 804aa1b:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804aa1e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 804aa21:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804aa24:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804aa27:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
 804aa2b:	79 0f                	jns    804aa3c <sdiv64+0x56>
 804aa2d:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804aa30:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804aa33:	f7 d8                	neg    %eax
 804aa35:	83 d2 00             	adc    $0x0,%edx
 804aa38:	f7 da                	neg    %edx
 804aa3a:	eb 06                	jmp    804aa42 <sdiv64+0x5c>
 804aa3c:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804aa3f:	8b 55 cc             	mov    -0x34(%ebp),%edx
 804aa42:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804aa45:	89 55 ec             	mov    %edx,-0x14(%ebp)
 804aa48:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aa4b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804aa4e:	89 44 24 08          	mov    %eax,0x8(%esp)
 804aa52:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804aa56:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aa59:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804aa5c:	89 04 24             	mov    %eax,(%esp)
 804aa5f:	89 54 24 04          	mov    %edx,0x4(%esp)
 804aa63:	e8 56 fd ff ff       	call   804a7be <udiv64>
 804aa68:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804aa6b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 804aa6e:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804aa71:	33 45 c8             	xor    -0x38(%ebp),%eax
 804aa74:	89 c6                	mov    %eax,%esi
 804aa76:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804aa79:	33 45 cc             	xor    -0x34(%ebp),%eax
 804aa7c:	89 c7                	mov    %eax,%edi
 804aa7e:	85 ff                	test   %edi,%edi
 804aa80:	79 0f                	jns    804aa91 <sdiv64+0xab>
 804aa82:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804aa85:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804aa88:	f7 d8                	neg    %eax
 804aa8a:	83 d2 00             	adc    $0x0,%edx
 804aa8d:	f7 da                	neg    %edx
 804aa8f:	eb 06                	jmp    804aa97 <sdiv64+0xb1>
 804aa91:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804aa94:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804aa97:	83 c4 40             	add    $0x40,%esp
 804aa9a:	5e                   	pop    %esi
 804aa9b:	5f                   	pop    %edi
 804aa9c:	5d                   	pop    %ebp
 804aa9d:	c3                   	ret

0804aa9e <smod64>:
 804aa9e:	55                   	push   %ebp
 804aa9f:	89 e5                	mov    %esp,%ebp
 804aaa1:	83 ec 28             	sub    $0x28,%esp
 804aaa4:	89 5d fc             	mov    %ebx,-0x4(%ebp)
 804aaa7:	8b 45 08             	mov    0x8(%ebp),%eax
 804aaaa:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804aaad:	8b 45 0c             	mov    0xc(%ebp),%eax
 804aab0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804aab3:	8b 45 10             	mov    0x10(%ebp),%eax
 804aab6:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804aab9:	8b 45 14             	mov    0x14(%ebp),%eax
 804aabc:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804aabf:	8b 5d f0             	mov    -0x10(%ebp),%ebx
 804aac2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aac5:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804aac8:	89 44 24 08          	mov    %eax,0x8(%esp)
 804aacc:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804aad0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804aad3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804aad6:	89 04 24             	mov    %eax,(%esp)
 804aad9:	89 54 24 04          	mov    %edx,0x4(%esp)
 804aadd:	e8 04 ff ff ff       	call   804a9e6 <sdiv64>
 804aae2:	89 c2                	mov    %eax,%edx
 804aae4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aae7:	0f af d0             	imul   %eax,%edx
 804aaea:	89 d8                	mov    %ebx,%eax
 804aaec:	29 d0                	sub    %edx,%eax
 804aaee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 804aaf1:	89 ec                	mov    %ebp,%esp
 804aaf3:	5d                   	pop    %ebp
 804aaf4:	c3                   	ret

0804aaf5 <__divdi3>:
 804aaf5:	55                   	push   %ebp
 804aaf6:	89 e5                	mov    %esp,%ebp
 804aaf8:	83 ec 20             	sub    $0x20,%esp
 804aafb:	8b 45 08             	mov    0x8(%ebp),%eax
 804aafe:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804ab01:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ab04:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ab07:	8b 45 10             	mov    0x10(%ebp),%eax
 804ab0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804ab0d:	8b 45 14             	mov    0x14(%ebp),%eax
 804ab10:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804ab13:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab16:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804ab19:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ab1d:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804ab21:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804ab24:	8b 55 fc             	mov    -0x4(%ebp),%edx
 804ab27:	89 04 24             	mov    %eax,(%esp)
 804ab2a:	89 54 24 04          	mov    %edx,0x4(%esp)
 804ab2e:	e8 b3 fe ff ff       	call   804a9e6 <sdiv64>
 804ab33:	89 ec                	mov    %ebp,%esp
 804ab35:	5d                   	pop    %ebp
 804ab36:	c3                   	ret

0804ab37 <__moddi3>:
 804ab37:	55                   	push   %ebp
 804ab38:	89 e5                	mov    %esp,%ebp
 804ab3a:	83 ec 20             	sub    $0x20,%esp
 804ab3d:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab40:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804ab43:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ab46:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ab49:	8b 45 10             	mov    0x10(%ebp),%eax
 804ab4c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804ab4f:	8b 45 14             	mov    0x14(%ebp),%eax
 804ab52:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804ab55:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab58:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804ab5b:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ab5f:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804ab63:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804ab66:	8b 55 fc             	mov    -0x4(%ebp),%edx
 804ab69:	89 04 24             	mov    %eax,(%esp)
 804ab6c:	89 54 24 04          	mov    %edx,0x4(%esp)
 804ab70:	e8 29 ff ff ff       	call   804aa9e <smod64>
 804ab75:	99                   	cltd
 804ab76:	89 ec                	mov    %ebp,%esp
 804ab78:	5d                   	pop    %ebp
 804ab79:	c3                   	ret

0804ab7a <__udivdi3>:
 804ab7a:	55                   	push   %ebp
 804ab7b:	89 e5                	mov    %esp,%ebp
 804ab7d:	83 ec 20             	sub    $0x20,%esp
 804ab80:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab83:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804ab86:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ab89:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ab8c:	8b 45 10             	mov    0x10(%ebp),%eax
 804ab8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804ab92:	8b 45 14             	mov    0x14(%ebp),%eax
 804ab95:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804ab98:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ab9b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804ab9e:	89 44 24 08          	mov    %eax,0x8(%esp)
 804aba2:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804aba6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804aba9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 804abac:	89 04 24             	mov    %eax,(%esp)
 804abaf:	89 54 24 04          	mov    %edx,0x4(%esp)
 804abb3:	e8 06 fc ff ff       	call   804a7be <udiv64>
 804abb8:	89 ec                	mov    %ebp,%esp
 804abba:	5d                   	pop    %ebp
 804abbb:	c3                   	ret

0804abbc <__umoddi3>:
 804abbc:	55                   	push   %ebp
 804abbd:	89 e5                	mov    %esp,%ebp
 804abbf:	83 ec 20             	sub    $0x20,%esp
 804abc2:	8b 45 08             	mov    0x8(%ebp),%eax
 804abc5:	89 45 f8             	mov    %eax,-0x8(%ebp)
 804abc8:	8b 45 0c             	mov    0xc(%ebp),%eax
 804abcb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804abce:	8b 45 10             	mov    0x10(%ebp),%eax
 804abd1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804abd4:	8b 45 14             	mov    0x14(%ebp),%eax
 804abd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804abda:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804abdd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804abe0:	89 44 24 08          	mov    %eax,0x8(%esp)
 804abe4:	89 54 24 0c          	mov    %edx,0xc(%esp)
 804abe8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804abeb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 804abee:	89 04 24             	mov    %eax,(%esp)
 804abf1:	89 54 24 04          	mov    %edx,0x4(%esp)
 804abf5:	e8 95 fd ff ff       	call   804a98f <umod64>
 804abfa:	ba 00 00 00 00       	mov    $0x0,%edx
 804abff:	89 ec                	mov    %ebp,%esp
 804ac01:	5d                   	pop    %ebp
 804ac02:	c3                   	ret

0804ac03 <debug_panic>:
 804ac03:	55                   	push   %ebp
 804ac04:	89 e5                	mov    %esp,%ebp
 804ac06:	83 ec 28             	sub    $0x28,%esp
 804ac09:	8b 45 10             	mov    0x10(%ebp),%eax
 804ac0c:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804ac10:	8b 45 0c             	mov    0xc(%ebp),%eax
 804ac13:	89 44 24 08          	mov    %eax,0x8(%esp)
 804ac17:	8b 45 08             	mov    0x8(%ebp),%eax
 804ac1a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ac1e:	c7 04 24 94 b9 04 08 	movl   $0x804b994,(%esp)
 804ac25:	e8 7e e0 ff ff       	call   8048ca8 <printf>
 804ac2a:	8d 45 18             	lea    0x18(%ebp),%eax
 804ac2d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804ac30:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ac33:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ac37:	8b 45 14             	mov    0x14(%ebp),%eax
 804ac3a:	89 04 24             	mov    %eax,(%esp)
 804ac3d:	e8 da 04 00 00       	call   804b11c <vprintf>
 804ac42:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 804ac49:	e8 5e 05 00 00       	call   804b1ac <putchar>
 804ac4e:	e8 70 06 00 00       	call   804b2c3 <debug_backtrace>
 804ac53:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804ac5a:	e8 4e 00 00 00       	call   804acad <exit>

0804ac5f <practice>:
 804ac5f:	55                   	push   %ebp
 804ac60:	89 e5                	mov    %esp,%ebp
 804ac62:	83 ec 10             	sub    $0x10,%esp
 804ac65:	ff 75 08             	push   0x8(%ebp)
 804ac68:	6a 0d                	push   $0xd
 804ac6a:	cd 30                	int    $0x30
 804ac6c:	83 c4 08             	add    $0x8,%esp
 804ac6f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ac72:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804ac75:	89 ec                	mov    %ebp,%esp
 804ac77:	5d                   	pop    %ebp
 804ac78:	c3                   	ret

0804ac79 <halt>:
 804ac79:	55                   	push   %ebp
 804ac7a:	89 e5                	mov    %esp,%ebp
 804ac7c:	83 ec 28             	sub    $0x28,%esp
 804ac7f:	6a 00                	push   $0x0
 804ac81:	cd 30                	int    $0x30
 804ac83:	83 c4 04             	add    $0x4,%esp
 804ac86:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804ac89:	c7 44 24 0c bc b9 04 	movl   $0x804b9bc,0xc(%esp)
 804ac90:	08 
 804ac91:	c7 44 24 08 f8 b9 04 	movl   $0x804b9f8,0x8(%esp)
 804ac98:	08 
 804ac99:	c7 44 24 04 47 00 00 	movl   $0x47,0x4(%esp)
 804aca0:	00 
 804aca1:	c7 04 24 de b9 04 08 	movl   $0x804b9de,(%esp)
 804aca8:	e8 56 ff ff ff       	call   804ac03 <debug_panic>

0804acad <exit>:
 804acad:	55                   	push   %ebp
 804acae:	89 e5                	mov    %esp,%ebp
 804acb0:	83 ec 28             	sub    $0x28,%esp
 804acb3:	ff 75 08             	push   0x8(%ebp)
 804acb6:	6a 01                	push   $0x1
 804acb8:	cd 30                	int    $0x30
 804acba:	83 c4 08             	add    $0x8,%esp
 804acbd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804acc0:	c7 44 24 0c bc b9 04 	movl   $0x804b9bc,0xc(%esp)
 804acc7:	08 
 804acc8:	c7 44 24 08 00 ba 04 	movl   $0x804ba00,0x8(%esp)
 804accf:	08 
 804acd0:	c7 44 24 04 4c 00 00 	movl   $0x4c,0x4(%esp)
 804acd7:	00 
 804acd8:	c7 04 24 de b9 04 08 	movl   $0x804b9de,(%esp)
 804acdf:	e8 1f ff ff ff       	call   804ac03 <debug_panic>

0804ace4 <exec>:
 804ace4:	55                   	push   %ebp
 804ace5:	89 e5                	mov    %esp,%ebp
 804ace7:	83 ec 10             	sub    $0x10,%esp
 804acea:	ff 75 08             	push   0x8(%ebp)
 804aced:	6a 02                	push   $0x2
 804acef:	cd 30                	int    $0x30
 804acf1:	83 c4 08             	add    $0x8,%esp
 804acf4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804acf7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804acfa:	89 ec                	mov    %ebp,%esp
 804acfc:	5d                   	pop    %ebp
 804acfd:	c3                   	ret

0804acfe <wait>:
 804acfe:	55                   	push   %ebp
 804acff:	89 e5                	mov    %esp,%ebp
 804ad01:	83 ec 10             	sub    $0x10,%esp
 804ad04:	ff 75 08             	push   0x8(%ebp)
 804ad07:	6a 03                	push   $0x3
 804ad09:	cd 30                	int    $0x30
 804ad0b:	83 c4 08             	add    $0x8,%esp
 804ad0e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ad11:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804ad14:	89 ec                	mov    %ebp,%esp
 804ad16:	5d                   	pop    %ebp
 804ad17:	c3                   	ret

0804ad18 <create>:
 804ad18:	55                   	push   %ebp
 804ad19:	89 e5                	mov    %esp,%ebp
 804ad1b:	83 ec 10             	sub    $0x10,%esp
 804ad1e:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad21:	8b 55 0c             	mov    0xc(%ebp),%edx
 804ad24:	52                   	push   %edx
 804ad25:	50                   	push   %eax
 804ad26:	6a 04                	push   $0x4
 804ad28:	cd 30                	int    $0x30
 804ad2a:	83 c4 0c             	add    $0xc,%esp
 804ad2d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ad30:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804ad33:	85 c0                	test   %eax,%eax
 804ad35:	0f 95 c0             	setne  %al
 804ad38:	89 ec                	mov    %ebp,%esp
 804ad3a:	5d                   	pop    %ebp
 804ad3b:	c3                   	ret

0804ad3c <remove>:
 804ad3c:	55                   	push   %ebp
 804ad3d:	89 e5                	mov    %esp,%ebp
 804ad3f:	83 ec 10             	sub    $0x10,%esp
 804ad42:	ff 75 08             	push   0x8(%ebp)
 804ad45:	6a 05                	push   $0x5
 804ad47:	cd 30                	int    $0x30
 804ad49:	83 c4 08             	add    $0x8,%esp
 804ad4c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ad4f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804ad52:	85 c0                	test   %eax,%eax
 804ad54:	0f 95 c0             	setne  %al
 804ad57:	89 ec                	mov    %ebp,%esp
 804ad59:	5d                   	pop    %ebp
 804ad5a:	c3                   	ret

0804ad5b <open>:
 804ad5b:	55                   	push   %ebp
 804ad5c:	89 e5                	mov    %esp,%ebp
 804ad5e:	83 ec 10             	sub    $0x10,%esp
 804ad61:	ff 75 08             	push   0x8(%ebp)
 804ad64:	6a 06                	push   $0x6
 804ad66:	cd 30                	int    $0x30
 804ad68:	83 c4 08             	add    $0x8,%esp
 804ad6b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ad6e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804ad71:	89 ec                	mov    %ebp,%esp
 804ad73:	5d                   	pop    %ebp
 804ad74:	c3                   	ret

0804ad75 <filesize>:
 804ad75:	55                   	push   %ebp
 804ad76:	89 e5                	mov    %esp,%ebp
 804ad78:	83 ec 10             	sub    $0x10,%esp
 804ad7b:	ff 75 08             	push   0x8(%ebp)
 804ad7e:	6a 07                	push   $0x7
 804ad80:	cd 30                	int    $0x30
 804ad82:	83 c4 08             	add    $0x8,%esp
 804ad85:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ad88:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804ad8b:	89 ec                	mov    %ebp,%esp
 804ad8d:	5d                   	pop    %ebp
 804ad8e:	c3                   	ret

0804ad8f <read>:
 804ad8f:	55                   	push   %ebp
 804ad90:	89 e5                	mov    %esp,%ebp
 804ad92:	83 ec 10             	sub    $0x10,%esp
 804ad95:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad98:	8b 55 0c             	mov    0xc(%ebp),%edx
 804ad9b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804ad9e:	51                   	push   %ecx
 804ad9f:	52                   	push   %edx
 804ada0:	50                   	push   %eax
 804ada1:	6a 08                	push   $0x8
 804ada3:	cd 30                	int    $0x30
 804ada5:	83 c4 10             	add    $0x10,%esp
 804ada8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804adab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804adae:	89 ec                	mov    %ebp,%esp
 804adb0:	5d                   	pop    %ebp
 804adb1:	c3                   	ret

0804adb2 <write>:
 804adb2:	55                   	push   %ebp
 804adb3:	89 e5                	mov    %esp,%ebp
 804adb5:	83 ec 10             	sub    $0x10,%esp
 804adb8:	8b 45 08             	mov    0x8(%ebp),%eax
 804adbb:	8b 55 0c             	mov    0xc(%ebp),%edx
 804adbe:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804adc1:	51                   	push   %ecx
 804adc2:	52                   	push   %edx
 804adc3:	50                   	push   %eax
 804adc4:	6a 09                	push   $0x9
 804adc6:	cd 30                	int    $0x30
 804adc8:	83 c4 10             	add    $0x10,%esp
 804adcb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804adce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804add1:	89 ec                	mov    %ebp,%esp
 804add3:	5d                   	pop    %ebp
 804add4:	c3                   	ret

0804add5 <seek>:
 804add5:	55                   	push   %ebp
 804add6:	89 e5                	mov    %esp,%ebp
 804add8:	83 ec 10             	sub    $0x10,%esp
 804addb:	8b 45 08             	mov    0x8(%ebp),%eax
 804adde:	8b 55 0c             	mov    0xc(%ebp),%edx
 804ade1:	52                   	push   %edx
 804ade2:	50                   	push   %eax
 804ade3:	6a 0a                	push   $0xa
 804ade5:	cd 30                	int    $0x30
 804ade7:	83 c4 0c             	add    $0xc,%esp
 804adea:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804aded:	90                   	nop
 804adee:	89 ec                	mov    %ebp,%esp
 804adf0:	5d                   	pop    %ebp
 804adf1:	c3                   	ret

0804adf2 <tell>:
 804adf2:	55                   	push   %ebp
 804adf3:	89 e5                	mov    %esp,%ebp
 804adf5:	83 ec 10             	sub    $0x10,%esp
 804adf8:	ff 75 08             	push   0x8(%ebp)
 804adfb:	6a 0b                	push   $0xb
 804adfd:	cd 30                	int    $0x30
 804adff:	83 c4 08             	add    $0x8,%esp
 804ae02:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ae05:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804ae08:	89 ec                	mov    %ebp,%esp
 804ae0a:	5d                   	pop    %ebp
 804ae0b:	c3                   	ret

0804ae0c <close>:
 804ae0c:	55                   	push   %ebp
 804ae0d:	89 e5                	mov    %esp,%ebp
 804ae0f:	83 ec 10             	sub    $0x10,%esp
 804ae12:	ff 75 08             	push   0x8(%ebp)
 804ae15:	6a 0c                	push   $0xc
 804ae17:	cd 30                	int    $0x30
 804ae19:	83 c4 08             	add    $0x8,%esp
 804ae1c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ae1f:	90                   	nop
 804ae20:	89 ec                	mov    %ebp,%esp
 804ae22:	5d                   	pop    %ebp
 804ae23:	c3                   	ret

0804ae24 <mmap>:
 804ae24:	55                   	push   %ebp
 804ae25:	89 e5                	mov    %esp,%ebp
 804ae27:	83 ec 10             	sub    $0x10,%esp
 804ae2a:	8b 45 08             	mov    0x8(%ebp),%eax
 804ae2d:	8b 55 0c             	mov    0xc(%ebp),%edx
 804ae30:	52                   	push   %edx
 804ae31:	50                   	push   %eax
 804ae32:	6a 19                	push   $0x19
 804ae34:	cd 30                	int    $0x30
 804ae36:	83 c4 0c             	add    $0xc,%esp
 804ae39:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ae3c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804ae3f:	89 ec                	mov    %ebp,%esp
 804ae41:	5d                   	pop    %ebp
 804ae42:	c3                   	ret

0804ae43 <munmap>:
 804ae43:	55                   	push   %ebp
 804ae44:	89 e5                	mov    %esp,%ebp
 804ae46:	83 ec 10             	sub    $0x10,%esp
 804ae49:	ff 75 08             	push   0x8(%ebp)
 804ae4c:	6a 1a                	push   $0x1a
 804ae4e:	cd 30                	int    $0x30
 804ae50:	83 c4 08             	add    $0x8,%esp
 804ae53:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ae56:	90                   	nop
 804ae57:	89 ec                	mov    %ebp,%esp
 804ae59:	5d                   	pop    %ebp
 804ae5a:	c3                   	ret

0804ae5b <chdir>:
 804ae5b:	55                   	push   %ebp
 804ae5c:	89 e5                	mov    %esp,%ebp
 804ae5e:	83 ec 10             	sub    $0x10,%esp
 804ae61:	ff 75 08             	push   0x8(%ebp)
 804ae64:	6a 1b                	push   $0x1b
 804ae66:	cd 30                	int    $0x30
 804ae68:	83 c4 08             	add    $0x8,%esp
 804ae6b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ae6e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804ae71:	85 c0                	test   %eax,%eax
 804ae73:	0f 95 c0             	setne  %al
 804ae76:	89 ec                	mov    %ebp,%esp
 804ae78:	5d                   	pop    %ebp
 804ae79:	c3                   	ret

0804ae7a <mkdir>:
 804ae7a:	55                   	push   %ebp
 804ae7b:	89 e5                	mov    %esp,%ebp
 804ae7d:	83 ec 10             	sub    $0x10,%esp
 804ae80:	ff 75 08             	push   0x8(%ebp)
 804ae83:	6a 1c                	push   $0x1c
 804ae85:	cd 30                	int    $0x30
 804ae87:	83 c4 08             	add    $0x8,%esp
 804ae8a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804ae8d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804ae90:	85 c0                	test   %eax,%eax
 804ae92:	0f 95 c0             	setne  %al
 804ae95:	89 ec                	mov    %ebp,%esp
 804ae97:	5d                   	pop    %ebp
 804ae98:	c3                   	ret

0804ae99 <readdir>:
 804ae99:	55                   	push   %ebp
 804ae9a:	89 e5                	mov    %esp,%ebp
 804ae9c:	83 ec 10             	sub    $0x10,%esp
 804ae9f:	8b 45 08             	mov    0x8(%ebp),%eax
 804aea2:	8b 55 0c             	mov    0xc(%ebp),%edx
 804aea5:	52                   	push   %edx
 804aea6:	50                   	push   %eax
 804aea7:	6a 1d                	push   $0x1d
 804aea9:	cd 30                	int    $0x30
 804aeab:	83 c4 0c             	add    $0xc,%esp
 804aeae:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804aeb1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804aeb4:	85 c0                	test   %eax,%eax
 804aeb6:	0f 95 c0             	setne  %al
 804aeb9:	89 ec                	mov    %ebp,%esp
 804aebb:	5d                   	pop    %ebp
 804aebc:	c3                   	ret

0804aebd <isdir>:
 804aebd:	55                   	push   %ebp
 804aebe:	89 e5                	mov    %esp,%ebp
 804aec0:	83 ec 10             	sub    $0x10,%esp
 804aec3:	ff 75 08             	push   0x8(%ebp)
 804aec6:	6a 1e                	push   $0x1e
 804aec8:	cd 30                	int    $0x30
 804aeca:	83 c4 08             	add    $0x8,%esp
 804aecd:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804aed0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804aed3:	85 c0                	test   %eax,%eax
 804aed5:	0f 95 c0             	setne  %al
 804aed8:	89 ec                	mov    %ebp,%esp
 804aeda:	5d                   	pop    %ebp
 804aedb:	c3                   	ret

0804aedc <inumber>:
 804aedc:	55                   	push   %ebp
 804aedd:	89 e5                	mov    %esp,%ebp
 804aedf:	83 ec 10             	sub    $0x10,%esp
 804aee2:	ff 75 08             	push   0x8(%ebp)
 804aee5:	6a 1f                	push   $0x1f
 804aee7:	cd 30                	int    $0x30
 804aee9:	83 c4 08             	add    $0x8,%esp
 804aeec:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804aeef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804aef2:	89 ec                	mov    %ebp,%esp
 804aef4:	5d                   	pop    %ebp
 804aef5:	c3                   	ret

0804aef6 <sys_pthread_create>:
 804aef6:	55                   	push   %ebp
 804aef7:	89 e5                	mov    %esp,%ebp
 804aef9:	83 ec 10             	sub    $0x10,%esp
 804aefc:	8b 45 08             	mov    0x8(%ebp),%eax
 804aeff:	8b 55 0c             	mov    0xc(%ebp),%edx
 804af02:	8b 4d 10             	mov    0x10(%ebp),%ecx
 804af05:	51                   	push   %ecx
 804af06:	52                   	push   %edx
 804af07:	50                   	push   %eax
 804af08:	6a 0e                	push   $0xe
 804af0a:	cd 30                	int    $0x30
 804af0c:	83 c4 10             	add    $0x10,%esp
 804af0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804af12:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804af15:	89 ec                	mov    %ebp,%esp
 804af17:	5d                   	pop    %ebp
 804af18:	c3                   	ret

0804af19 <sys_pthread_exit>:
 804af19:	55                   	push   %ebp
 804af1a:	89 e5                	mov    %esp,%ebp
 804af1c:	83 ec 28             	sub    $0x28,%esp
 804af1f:	6a 0f                	push   $0xf
 804af21:	cd 30                	int    $0x30
 804af23:	83 c4 04             	add    $0x4,%esp
 804af26:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804af29:	c7 44 24 0c bc b9 04 	movl   $0x804b9bc,0xc(%esp)
 804af30:	08 
 804af31:	c7 44 24 08 08 ba 04 	movl   $0x804ba08,0x8(%esp)
 804af38:	08 
 804af39:	c7 44 24 04 7d 00 00 	movl   $0x7d,0x4(%esp)
 804af40:	00 
 804af41:	c7 04 24 de b9 04 08 	movl   $0x804b9de,(%esp)
 804af48:	e8 b6 fc ff ff       	call   804ac03 <debug_panic>

0804af4d <sys_pthread_join>:
 804af4d:	55                   	push   %ebp
 804af4e:	89 e5                	mov    %esp,%ebp
 804af50:	83 ec 10             	sub    $0x10,%esp
 804af53:	ff 75 08             	push   0x8(%ebp)
 804af56:	6a 10                	push   $0x10
 804af58:	cd 30                	int    $0x30
 804af5a:	83 c4 08             	add    $0x8,%esp
 804af5d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804af60:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804af63:	89 ec                	mov    %ebp,%esp
 804af65:	5d                   	pop    %ebp
 804af66:	c3                   	ret

0804af67 <lock_init>:
 804af67:	55                   	push   %ebp
 804af68:	89 e5                	mov    %esp,%ebp
 804af6a:	83 ec 10             	sub    $0x10,%esp
 804af6d:	ff 75 08             	push   0x8(%ebp)
 804af70:	6a 11                	push   $0x11
 804af72:	cd 30                	int    $0x30
 804af74:	83 c4 08             	add    $0x8,%esp
 804af77:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804af7a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804af7d:	85 c0                	test   %eax,%eax
 804af7f:	0f 95 c0             	setne  %al
 804af82:	89 ec                	mov    %ebp,%esp
 804af84:	5d                   	pop    %ebp
 804af85:	c3                   	ret

0804af86 <lock_acquire>:
 804af86:	55                   	push   %ebp
 804af87:	89 e5                	mov    %esp,%ebp
 804af89:	83 ec 28             	sub    $0x28,%esp
 804af8c:	ff 75 08             	push   0x8(%ebp)
 804af8f:	6a 12                	push   $0x12
 804af91:	cd 30                	int    $0x30
 804af93:	83 c4 08             	add    $0x8,%esp
 804af96:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804af99:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804af9c:	85 c0                	test   %eax,%eax
 804af9e:	0f 95 c0             	setne  %al
 804afa1:	88 45 f3             	mov    %al,-0xd(%ebp)
 804afa4:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 804afa8:	34 01                	xor    $0x1,%al
 804afaa:	84 c0                	test   %al,%al
 804afac:	74 0c                	je     804afba <lock_acquire+0x34>
 804afae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804afb5:	e8 f3 fc ff ff       	call   804acad <exit>
 804afba:	90                   	nop
 804afbb:	89 ec                	mov    %ebp,%esp
 804afbd:	5d                   	pop    %ebp
 804afbe:	c3                   	ret

0804afbf <lock_release>:
 804afbf:	55                   	push   %ebp
 804afc0:	89 e5                	mov    %esp,%ebp
 804afc2:	83 ec 28             	sub    $0x28,%esp
 804afc5:	ff 75 08             	push   0x8(%ebp)
 804afc8:	6a 13                	push   $0x13
 804afca:	cd 30                	int    $0x30
 804afcc:	83 c4 08             	add    $0x8,%esp
 804afcf:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804afd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804afd5:	85 c0                	test   %eax,%eax
 804afd7:	0f 95 c0             	setne  %al
 804afda:	88 45 f3             	mov    %al,-0xd(%ebp)
 804afdd:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 804afe1:	34 01                	xor    $0x1,%al
 804afe3:	84 c0                	test   %al,%al
 804afe5:	74 0c                	je     804aff3 <lock_release+0x34>
 804afe7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804afee:	e8 ba fc ff ff       	call   804acad <exit>
 804aff3:	90                   	nop
 804aff4:	89 ec                	mov    %ebp,%esp
 804aff6:	5d                   	pop    %ebp
 804aff7:	c3                   	ret

0804aff8 <sema_init>:
 804aff8:	55                   	push   %ebp
 804aff9:	89 e5                	mov    %esp,%ebp
 804affb:	83 ec 10             	sub    $0x10,%esp
 804affe:	8b 45 08             	mov    0x8(%ebp),%eax
 804b001:	8b 55 0c             	mov    0xc(%ebp),%edx
 804b004:	52                   	push   %edx
 804b005:	50                   	push   %eax
 804b006:	6a 14                	push   $0x14
 804b008:	cd 30                	int    $0x30
 804b00a:	83 c4 0c             	add    $0xc,%esp
 804b00d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804b010:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804b013:	85 c0                	test   %eax,%eax
 804b015:	0f 95 c0             	setne  %al
 804b018:	89 ec                	mov    %ebp,%esp
 804b01a:	5d                   	pop    %ebp
 804b01b:	c3                   	ret

0804b01c <sema_down>:
 804b01c:	55                   	push   %ebp
 804b01d:	89 e5                	mov    %esp,%ebp
 804b01f:	83 ec 28             	sub    $0x28,%esp
 804b022:	ff 75 08             	push   0x8(%ebp)
 804b025:	6a 15                	push   $0x15
 804b027:	cd 30                	int    $0x30
 804b029:	83 c4 08             	add    $0x8,%esp
 804b02c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b02f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b032:	85 c0                	test   %eax,%eax
 804b034:	0f 95 c0             	setne  %al
 804b037:	88 45 f3             	mov    %al,-0xd(%ebp)
 804b03a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 804b03e:	34 01                	xor    $0x1,%al
 804b040:	84 c0                	test   %al,%al
 804b042:	74 0c                	je     804b050 <sema_down+0x34>
 804b044:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804b04b:	e8 5d fc ff ff       	call   804acad <exit>
 804b050:	90                   	nop
 804b051:	89 ec                	mov    %ebp,%esp
 804b053:	5d                   	pop    %ebp
 804b054:	c3                   	ret

0804b055 <sema_up>:
 804b055:	55                   	push   %ebp
 804b056:	89 e5                	mov    %esp,%ebp
 804b058:	83 ec 28             	sub    $0x28,%esp
 804b05b:	ff 75 08             	push   0x8(%ebp)
 804b05e:	6a 16                	push   $0x16
 804b060:	cd 30                	int    $0x30
 804b062:	83 c4 08             	add    $0x8,%esp
 804b065:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b068:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b06b:	85 c0                	test   %eax,%eax
 804b06d:	0f 95 c0             	setne  %al
 804b070:	88 45 f3             	mov    %al,-0xd(%ebp)
 804b073:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
 804b077:	34 01                	xor    $0x1,%al
 804b079:	84 c0                	test   %al,%al
 804b07b:	74 0c                	je     804b089 <sema_up+0x34>
 804b07d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804b084:	e8 24 fc ff ff       	call   804acad <exit>
 804b089:	90                   	nop
 804b08a:	89 ec                	mov    %ebp,%esp
 804b08c:	5d                   	pop    %ebp
 804b08d:	c3                   	ret

0804b08e <get_tid>:
 804b08e:	55                   	push   %ebp
 804b08f:	89 e5                	mov    %esp,%ebp
 804b091:	83 ec 10             	sub    $0x10,%esp
 804b094:	6a 17                	push   $0x17
 804b096:	cd 30                	int    $0x30
 804b098:	83 c4 04             	add    $0x4,%esp
 804b09b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804b09e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804b0a1:	89 ec                	mov    %ebp,%esp
 804b0a3:	5d                   	pop    %ebp
 804b0a4:	c3                   	ret

0804b0a5 <fork>:
 804b0a5:	55                   	push   %ebp
 804b0a6:	89 e5                	mov    %esp,%ebp
 804b0a8:	83 ec 10             	sub    $0x10,%esp
 804b0ab:	6a 18                	push   $0x18
 804b0ad:	cd 30                	int    $0x30
 804b0af:	83 c4 04             	add    $0x4,%esp
 804b0b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804b0b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804b0b8:	89 ec                	mov    %ebp,%esp
 804b0ba:	5d                   	pop    %ebp
 804b0bb:	c3                   	ret

0804b0bc <pthread_create>:
 804b0bc:	55                   	push   %ebp
 804b0bd:	89 e5                	mov    %esp,%ebp
 804b0bf:	83 ec 18             	sub    $0x18,%esp
 804b0c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b0c5:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b0c9:	8b 45 08             	mov    0x8(%ebp),%eax
 804b0cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b0d0:	c7 04 24 06 b1 04 08 	movl   $0x804b106,(%esp)
 804b0d7:	e8 1a fe ff ff       	call   804aef6 <sys_pthread_create>
 804b0dc:	89 ec                	mov    %ebp,%esp
 804b0de:	5d                   	pop    %ebp
 804b0df:	c3                   	ret

0804b0e0 <pthread_exit>:
 804b0e0:	55                   	push   %ebp
 804b0e1:	89 e5                	mov    %esp,%ebp
 804b0e3:	83 ec 08             	sub    $0x8,%esp
 804b0e6:	e8 2e fe ff ff       	call   804af19 <sys_pthread_exit>

0804b0eb <pthread_join>:
 804b0eb:	55                   	push   %ebp
 804b0ec:	89 e5                	mov    %esp,%ebp
 804b0ee:	83 ec 18             	sub    $0x18,%esp
 804b0f1:	8b 45 08             	mov    0x8(%ebp),%eax
 804b0f4:	89 04 24             	mov    %eax,(%esp)
 804b0f7:	e8 51 fe ff ff       	call   804af4d <sys_pthread_join>
 804b0fc:	83 f8 ff             	cmp    $0xffffffff,%eax
 804b0ff:	0f 95 c0             	setne  %al
 804b102:	89 ec                	mov    %ebp,%esp
 804b104:	5d                   	pop    %ebp
 804b105:	c3                   	ret

0804b106 <_pthread_start_stub>:
 804b106:	55                   	push   %ebp
 804b107:	89 e5                	mov    %esp,%ebp
 804b109:	83 ec 18             	sub    $0x18,%esp
 804b10c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b10f:	89 04 24             	mov    %eax,(%esp)
 804b112:	8b 45 08             	mov    0x8(%ebp),%eax
 804b115:	ff d0                	call   *%eax
 804b117:	e8 c4 ff ff ff       	call   804b0e0 <pthread_exit>

0804b11c <vprintf>:
 804b11c:	55                   	push   %ebp
 804b11d:	89 e5                	mov    %esp,%ebp
 804b11f:	83 ec 18             	sub    $0x18,%esp
 804b122:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b125:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b129:	8b 45 08             	mov    0x8(%ebp),%eax
 804b12c:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b130:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804b137:	e8 9e 00 00 00       	call   804b1da <vhprintf>
 804b13c:	89 ec                	mov    %ebp,%esp
 804b13e:	5d                   	pop    %ebp
 804b13f:	c3                   	ret

0804b140 <hprintf>:
 804b140:	55                   	push   %ebp
 804b141:	89 e5                	mov    %esp,%ebp
 804b143:	83 ec 28             	sub    $0x28,%esp
 804b146:	8d 45 10             	lea    0x10(%ebp),%eax
 804b149:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804b14c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804b14f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b153:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b156:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b15a:	8b 45 08             	mov    0x8(%ebp),%eax
 804b15d:	89 04 24             	mov    %eax,(%esp)
 804b160:	e8 75 00 00 00       	call   804b1da <vhprintf>
 804b165:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b168:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b16b:	89 ec                	mov    %ebp,%esp
 804b16d:	5d                   	pop    %ebp
 804b16e:	c3                   	ret

0804b16f <puts>:
 804b16f:	55                   	push   %ebp
 804b170:	89 e5                	mov    %esp,%ebp
 804b172:	83 ec 18             	sub    $0x18,%esp
 804b175:	8b 45 08             	mov    0x8(%ebp),%eax
 804b178:	89 04 24             	mov    %eax,(%esp)
 804b17b:	e8 74 f3 ff ff       	call   804a4f4 <strlen>
 804b180:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b184:	8b 45 08             	mov    0x8(%ebp),%eax
 804b187:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b18b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804b192:	e8 1b fc ff ff       	call   804adb2 <write>
 804b197:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 804b19e:	e8 09 00 00 00       	call   804b1ac <putchar>
 804b1a3:	b8 00 00 00 00       	mov    $0x0,%eax
 804b1a8:	89 ec                	mov    %ebp,%esp
 804b1aa:	5d                   	pop    %ebp
 804b1ab:	c3                   	ret

0804b1ac <putchar>:
 804b1ac:	55                   	push   %ebp
 804b1ad:	89 e5                	mov    %esp,%ebp
 804b1af:	83 ec 28             	sub    $0x28,%esp
 804b1b2:	8b 45 08             	mov    0x8(%ebp),%eax
 804b1b5:	88 45 f7             	mov    %al,-0x9(%ebp)
 804b1b8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 804b1bf:	00 
 804b1c0:	8d 45 f7             	lea    -0x9(%ebp),%eax
 804b1c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b1c7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804b1ce:	e8 df fb ff ff       	call   804adb2 <write>
 804b1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 804b1d6:	89 ec                	mov    %ebp,%esp
 804b1d8:	5d                   	pop    %ebp
 804b1d9:	c3                   	ret

0804b1da <vhprintf>:
 804b1da:	55                   	push   %ebp
 804b1db:	89 e5                	mov    %esp,%ebp
 804b1dd:	83 ec 68             	sub    $0x68,%esp
 804b1e0:	8d 45 ac             	lea    -0x54(%ebp),%eax
 804b1e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804b1e6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804b1ed:	8b 45 08             	mov    0x8(%ebp),%eax
 804b1f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b1f3:	8d 45 ac             	lea    -0x54(%ebp),%eax
 804b1f6:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804b1fa:	c7 44 24 08 26 b2 04 	movl   $0x804b226,0x8(%esp)
 804b201:	08 
 804b202:	8b 45 10             	mov    0x10(%ebp),%eax
 804b205:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b209:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b20c:	89 04 24             	mov    %eax,(%esp)
 804b20f:	e8 bc da ff ff       	call   8048cd0 <__vprintf>
 804b214:	8d 45 ac             	lea    -0x54(%ebp),%eax
 804b217:	89 04 24             	mov    %eax,(%esp)
 804b21a:	e8 5d 00 00 00       	call   804b27c <flush>
 804b21f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804b222:	89 ec                	mov    %ebp,%esp
 804b224:	5d                   	pop    %ebp
 804b225:	c3                   	ret

0804b226 <add_char>:
 804b226:	55                   	push   %ebp
 804b227:	89 e5                	mov    %esp,%ebp
 804b229:	83 ec 38             	sub    $0x38,%esp
 804b22c:	8b 45 08             	mov    0x8(%ebp),%eax
 804b22f:	88 45 e4             	mov    %al,-0x1c(%ebp)
 804b232:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b235:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b238:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b23b:	8b 40 40             	mov    0x40(%eax),%eax
 804b23e:	8d 48 01             	lea    0x1(%eax),%ecx
 804b241:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804b244:	89 4a 40             	mov    %ecx,0x40(%edx)
 804b247:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
 804b24b:	88 10                	mov    %dl,(%eax)
 804b24d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b250:	8b 40 40             	mov    0x40(%eax),%eax
 804b253:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804b256:	83 c2 40             	add    $0x40,%edx
 804b259:	39 d0                	cmp    %edx,%eax
 804b25b:	72 0b                	jb     804b268 <add_char+0x42>
 804b25d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b260:	89 04 24             	mov    %eax,(%esp)
 804b263:	e8 14 00 00 00       	call   804b27c <flush>
 804b268:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b26b:	8b 40 44             	mov    0x44(%eax),%eax
 804b26e:	8d 50 01             	lea    0x1(%eax),%edx
 804b271:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b274:	89 50 44             	mov    %edx,0x44(%eax)
 804b277:	90                   	nop
 804b278:	89 ec                	mov    %ebp,%esp
 804b27a:	5d                   	pop    %ebp
 804b27b:	c3                   	ret

0804b27c <flush>:
 804b27c:	55                   	push   %ebp
 804b27d:	89 e5                	mov    %esp,%ebp
 804b27f:	83 ec 18             	sub    $0x18,%esp
 804b282:	8b 45 08             	mov    0x8(%ebp),%eax
 804b285:	8b 50 40             	mov    0x40(%eax),%edx
 804b288:	8b 45 08             	mov    0x8(%ebp),%eax
 804b28b:	39 c2                	cmp    %eax,%edx
 804b28d:	76 26                	jbe    804b2b5 <flush+0x39>
 804b28f:	8b 45 08             	mov    0x8(%ebp),%eax
 804b292:	8b 40 40             	mov    0x40(%eax),%eax
 804b295:	8b 55 08             	mov    0x8(%ebp),%edx
 804b298:	29 d0                	sub    %edx,%eax
 804b29a:	89 c1                	mov    %eax,%ecx
 804b29c:	8b 55 08             	mov    0x8(%ebp),%edx
 804b29f:	8b 45 08             	mov    0x8(%ebp),%eax
 804b2a2:	8b 40 48             	mov    0x48(%eax),%eax
 804b2a5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804b2a9:	89 54 24 04          	mov    %edx,0x4(%esp)
 804b2ad:	89 04 24             	mov    %eax,(%esp)
 804b2b0:	e8 fd fa ff ff       	call   804adb2 <write>
 804b2b5:	8b 55 08             	mov    0x8(%ebp),%edx
 804b2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 804b2bb:	89 50 40             	mov    %edx,0x40(%eax)
 804b2be:	90                   	nop
 804b2bf:	89 ec                	mov    %ebp,%esp
 804b2c1:	5d                   	pop    %ebp
 804b2c2:	c3                   	ret

0804b2c3 <debug_backtrace>:
 804b2c3:	55                   	push   %ebp
 804b2c4:	89 e5                	mov    %esp,%ebp
 804b2c6:	83 ec 28             	sub    $0x28,%esp
 804b2c9:	8b 45 04             	mov    0x4(%ebp),%eax
 804b2cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b2d0:	c7 04 24 1c ba 04 08 	movl   $0x804ba1c,(%esp)
 804b2d7:	e8 cc d9 ff ff       	call   8048ca8 <printf>
 804b2dc:	8b 45 00             	mov    0x0(%ebp),%eax
 804b2df:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b2e2:	eb 20                	jmp    804b304 <debug_backtrace+0x41>
 804b2e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b2e7:	83 c0 04             	add    $0x4,%eax
 804b2ea:	8b 00                	mov    (%eax),%eax
 804b2ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b2f0:	c7 04 24 2b ba 04 08 	movl   $0x804ba2b,(%esp)
 804b2f7:	e8 ac d9 ff ff       	call   8048ca8 <printf>
 804b2fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b2ff:	8b 00                	mov    (%eax),%eax
 804b301:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804b304:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b307:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 804b30c:	76 09                	jbe    804b317 <debug_backtrace+0x54>
 804b30e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b311:	8b 00                	mov    (%eax),%eax
 804b313:	85 c0                	test   %eax,%eax
 804b315:	75 cd                	jne    804b2e4 <debug_backtrace+0x21>
 804b317:	c7 04 24 2f ba 04 08 	movl   $0x804ba2f,(%esp)
 804b31e:	e8 4c fe ff ff       	call   804b16f <puts>
 804b323:	0f b6 05 23 d0 04 08 	movzbl 0x804d023,%eax
 804b32a:	34 01                	xor    $0x1,%al
 804b32c:	84 c0                	test   %al,%al
 804b32e:	74 13                	je     804b343 <debug_backtrace+0x80>
 804b330:	c6 05 23 d0 04 08 01 	movb   $0x1,0x804d023
 804b337:	c7 04 24 34 ba 04 08 	movl   $0x804ba34,(%esp)
 804b33e:	e8 2c fe ff ff       	call   804b16f <puts>
 804b343:	90                   	nop
 804b344:	89 ec                	mov    %ebp,%esp
 804b346:	5d                   	pop    %ebp
 804b347:	c3                   	ret
