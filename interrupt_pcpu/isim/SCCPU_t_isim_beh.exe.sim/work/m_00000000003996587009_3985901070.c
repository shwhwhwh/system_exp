/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/lirui/Desktop/lr/interrupt_pcpu/remote_sources/_/SCCPU/SCCPU.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {49024U, 0U};
static unsigned int ng7[] = {20U, 0U};



static void Always_63_0(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;

LAB0:    t1 = (t0 + 15168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 16480);
    *((int *)t2) = 1;
    t3 = (t0 + 15200);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(63, ng0);

LAB5:    xsi_set_current_line(64, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 14248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 14248);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 32, 0LL);

LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(64, ng0);
    t28 = ((char*)((ng2)));
    t29 = (t0 + 14248);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 32, 0LL);
    goto LAB12;

}

static void Cont_163_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t22[8];
    char t37[8];
    char t53[8];
    char t61[8];
    char t89[8];
    char t103[8];
    char t110[8];
    char t142[8];
    char t157[8];
    char t173[8];
    char t187[8];
    char t203[8];
    char t211[8];
    char t243[8];
    char t251[8];
    char t279[8];
    char t294[8];
    char t310[8];
    char t318[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    char *t101;
    char *t102;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    char *t115;
    char *t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    char *t124;
    char *t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    int t134;
    int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    char *t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    unsigned int t147;
    unsigned int t148;
    char *t149;
    char *t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    unsigned int t154;
    char *t155;
    char *t156;
    char *t158;
    char *t159;
    unsigned int t160;
    unsigned int t161;
    unsigned int t162;
    unsigned int t163;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    char *t172;
    char *t174;
    unsigned int t175;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    char *t180;
    char *t181;
    unsigned int t182;
    unsigned int t183;
    unsigned int t184;
    char *t185;
    char *t186;
    char *t188;
    char *t189;
    unsigned int t190;
    unsigned int t191;
    unsigned int t192;
    unsigned int t193;
    unsigned int t194;
    unsigned int t195;
    unsigned int t196;
    unsigned int t197;
    unsigned int t198;
    unsigned int t199;
    unsigned int t200;
    unsigned int t201;
    char *t202;
    char *t204;
    unsigned int t205;
    unsigned int t206;
    unsigned int t207;
    unsigned int t208;
    unsigned int t209;
    char *t210;
    unsigned int t212;
    unsigned int t213;
    unsigned int t214;
    char *t215;
    char *t216;
    char *t217;
    unsigned int t218;
    unsigned int t219;
    unsigned int t220;
    unsigned int t221;
    unsigned int t222;
    unsigned int t223;
    unsigned int t224;
    char *t225;
    char *t226;
    unsigned int t227;
    unsigned int t228;
    unsigned int t229;
    unsigned int t230;
    unsigned int t231;
    unsigned int t232;
    unsigned int t233;
    unsigned int t234;
    int t235;
    int t236;
    unsigned int t237;
    unsigned int t238;
    unsigned int t239;
    unsigned int t240;
    unsigned int t241;
    unsigned int t242;
    char *t244;
    unsigned int t245;
    unsigned int t246;
    unsigned int t247;
    unsigned int t248;
    unsigned int t249;
    char *t250;
    unsigned int t252;
    unsigned int t253;
    unsigned int t254;
    char *t255;
    char *t256;
    char *t257;
    unsigned int t258;
    unsigned int t259;
    unsigned int t260;
    unsigned int t261;
    unsigned int t262;
    unsigned int t263;
    unsigned int t264;
    char *t265;
    char *t266;
    unsigned int t267;
    unsigned int t268;
    unsigned int t269;
    int t270;
    unsigned int t271;
    unsigned int t272;
    unsigned int t273;
    int t274;
    unsigned int t275;
    unsigned int t276;
    unsigned int t277;
    unsigned int t278;
    char *t280;
    unsigned int t281;
    unsigned int t282;
    unsigned int t283;
    unsigned int t284;
    unsigned int t285;
    char *t286;
    char *t287;
    unsigned int t288;
    unsigned int t289;
    unsigned int t290;
    unsigned int t291;
    char *t292;
    char *t293;
    char *t295;
    char *t296;
    unsigned int t297;
    unsigned int t298;
    unsigned int t299;
    unsigned int t300;
    unsigned int t301;
    unsigned int t302;
    unsigned int t303;
    unsigned int t304;
    unsigned int t305;
    unsigned int t306;
    unsigned int t307;
    unsigned int t308;
    char *t309;
    char *t311;
    unsigned int t312;
    unsigned int t313;
    unsigned int t314;
    unsigned int t315;
    unsigned int t316;
    char *t317;
    unsigned int t319;
    unsigned int t320;
    unsigned int t321;
    char *t322;
    char *t323;
    char *t324;
    unsigned int t325;
    unsigned int t326;
    unsigned int t327;
    unsigned int t328;
    unsigned int t329;
    unsigned int t330;
    unsigned int t331;
    char *t332;
    char *t333;
    unsigned int t334;
    unsigned int t335;
    unsigned int t336;
    int t337;
    unsigned int t338;
    unsigned int t339;
    unsigned int t340;
    int t341;
    unsigned int t342;
    unsigned int t343;
    unsigned int t344;
    unsigned int t345;
    char *t346;
    unsigned int t347;
    unsigned int t348;
    unsigned int t349;
    unsigned int t350;
    unsigned int t351;
    char *t352;
    char *t353;
    unsigned int t354;
    unsigned int t355;
    unsigned int t356;
    char *t357;
    unsigned int t358;
    unsigned int t359;
    unsigned int t360;
    unsigned int t361;
    char *t362;
    char *t363;
    char *t364;
    char *t365;
    char *t366;
    char *t367;
    char *t368;

LAB0:    t1 = (t0 + 15416U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 3448U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t22, 0, 8);
    t23 = (t6 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t23) != 0)
        goto LAB10;

LAB11:    t30 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = (!(t31));
    t33 = *((unsigned int *)t30);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB12;

LAB13:    memcpy(t61, t22, 8);

LAB14:    memset(t89, 0, 8);
    t90 = (t61 + 4);
    t91 = *((unsigned int *)t90);
    t92 = (~(t91));
    t93 = *((unsigned int *)t61);
    t94 = (t93 & t92);
    t95 = (t94 & 1U);
    if (t95 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t90) != 0)
        goto LAB28;

LAB29:    t97 = (t89 + 4);
    t98 = *((unsigned int *)t89);
    t99 = *((unsigned int *)t97);
    t100 = (t98 || t99);
    if (t100 > 0)
        goto LAB30;

LAB31:    memcpy(t110, t89, 8);

LAB32:    memset(t142, 0, 8);
    t143 = (t110 + 4);
    t144 = *((unsigned int *)t143);
    t145 = (~(t144));
    t146 = *((unsigned int *)t110);
    t147 = (t146 & t145);
    t148 = (t147 & 1U);
    if (t148 != 0)
        goto LAB40;

LAB41:    if (*((unsigned int *)t143) != 0)
        goto LAB42;

LAB43:    t150 = (t142 + 4);
    t151 = *((unsigned int *)t142);
    t152 = (!(t151));
    t153 = *((unsigned int *)t150);
    t154 = (t152 || t153);
    if (t154 > 0)
        goto LAB44;

LAB45:    memcpy(t251, t142, 8);

LAB46:    memset(t279, 0, 8);
    t280 = (t251 + 4);
    t281 = *((unsigned int *)t280);
    t282 = (~(t281));
    t283 = *((unsigned int *)t251);
    t284 = (t283 & t282);
    t285 = (t284 & 1U);
    if (t285 != 0)
        goto LAB76;

LAB77:    if (*((unsigned int *)t280) != 0)
        goto LAB78;

LAB79:    t287 = (t279 + 4);
    t288 = *((unsigned int *)t279);
    t289 = (!(t288));
    t290 = *((unsigned int *)t287);
    t291 = (t289 || t290);
    if (t291 > 0)
        goto LAB80;

LAB81:    memcpy(t318, t279, 8);

LAB82:    memset(t4, 0, 8);
    t346 = (t318 + 4);
    t347 = *((unsigned int *)t346);
    t348 = (~(t347));
    t349 = *((unsigned int *)t318);
    t350 = (t349 & t348);
    t351 = (t350 & 1U);
    if (t351 != 0)
        goto LAB94;

LAB95:    if (*((unsigned int *)t346) != 0)
        goto LAB96;

LAB97:    t353 = (t4 + 4);
    t354 = *((unsigned int *)t4);
    t355 = *((unsigned int *)t353);
    t356 = (t354 || t355);
    if (t356 > 0)
        goto LAB98;

LAB99:    t358 = *((unsigned int *)t4);
    t359 = (~(t358));
    t360 = *((unsigned int *)t353);
    t361 = (t359 || t360);
    if (t361 > 0)
        goto LAB100;

LAB101:    if (*((unsigned int *)t353) > 0)
        goto LAB102;

LAB103:    if (*((unsigned int *)t4) > 0)
        goto LAB104;

LAB105:    memcpy(t3, t363, 8);

LAB106:    t362 = (t0 + 16624);
    t364 = (t362 + 56U);
    t365 = *((char **)t364);
    t366 = (t365 + 56U);
    t367 = *((char **)t366);
    memcpy(t367, t3, 8);
    xsi_driver_vfirst_trans(t362, 0, 31);
    t368 = (t0 + 16496);
    *((int *)t368) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t22) = 1;
    goto LAB11;

LAB10:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB11;

LAB12:    t35 = (t0 + 3448U);
    t36 = *((char **)t35);
    t35 = ((char*)((ng5)));
    memset(t37, 0, 8);
    t38 = (t36 + 4);
    t39 = (t35 + 4);
    t40 = *((unsigned int *)t36);
    t41 = *((unsigned int *)t35);
    t42 = (t40 ^ t41);
    t43 = *((unsigned int *)t38);
    t44 = *((unsigned int *)t39);
    t45 = (t43 ^ t44);
    t46 = (t42 | t45);
    t47 = *((unsigned int *)t38);
    t48 = *((unsigned int *)t39);
    t49 = (t47 | t48);
    t50 = (~(t49));
    t51 = (t46 & t50);
    if (t51 != 0)
        goto LAB18;

LAB15:    if (t49 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t37) = 1;

LAB18:    memset(t53, 0, 8);
    t54 = (t37 + 4);
    t55 = *((unsigned int *)t54);
    t56 = (~(t55));
    t57 = *((unsigned int *)t37);
    t58 = (t57 & t56);
    t59 = (t58 & 1U);
    if (t59 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t54) != 0)
        goto LAB21;

LAB22:    t62 = *((unsigned int *)t22);
    t63 = *((unsigned int *)t53);
    t64 = (t62 | t63);
    *((unsigned int *)t61) = t64;
    t65 = (t22 + 4);
    t66 = (t53 + 4);
    t67 = (t61 + 4);
    t68 = *((unsigned int *)t65);
    t69 = *((unsigned int *)t66);
    t70 = (t68 | t69);
    *((unsigned int *)t67) = t70;
    t71 = *((unsigned int *)t67);
    t72 = (t71 != 0);
    if (t72 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB17:    t52 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t52) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t53) = 1;
    goto LAB22;

LAB21:    t60 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t60) = 1;
    goto LAB22;

LAB23:    t73 = *((unsigned int *)t61);
    t74 = *((unsigned int *)t67);
    *((unsigned int *)t61) = (t73 | t74);
    t75 = (t22 + 4);
    t76 = (t53 + 4);
    t77 = *((unsigned int *)t75);
    t78 = (~(t77));
    t79 = *((unsigned int *)t22);
    t80 = (t79 & t78);
    t81 = *((unsigned int *)t76);
    t82 = (~(t81));
    t83 = *((unsigned int *)t53);
    t84 = (t83 & t82);
    t85 = (~(t80));
    t86 = (~(t84));
    t87 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t87 & t85);
    t88 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t88 & t86);
    goto LAB25;

LAB26:    *((unsigned int *)t89) = 1;
    goto LAB29;

LAB28:    t96 = (t89 + 4);
    *((unsigned int *)t89) = 1;
    *((unsigned int *)t96) = 1;
    goto LAB29;

LAB30:    t101 = (t0 + 5528U);
    t102 = *((char **)t101);
    memset(t103, 0, 8);
    t101 = (t102 + 4);
    t104 = *((unsigned int *)t101);
    t105 = (~(t104));
    t106 = *((unsigned int *)t102);
    t107 = (t106 & t105);
    t108 = (t107 & 1U);
    if (t108 != 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t101) != 0)
        goto LAB35;

LAB36:    t111 = *((unsigned int *)t89);
    t112 = *((unsigned int *)t103);
    t113 = (t111 & t112);
    *((unsigned int *)t110) = t113;
    t114 = (t89 + 4);
    t115 = (t103 + 4);
    t116 = (t110 + 4);
    t117 = *((unsigned int *)t114);
    t118 = *((unsigned int *)t115);
    t119 = (t117 | t118);
    *((unsigned int *)t116) = t119;
    t120 = *((unsigned int *)t116);
    t121 = (t120 != 0);
    if (t121 == 1)
        goto LAB37;

LAB38:
LAB39:    goto LAB32;

LAB33:    *((unsigned int *)t103) = 1;
    goto LAB36;

LAB35:    t109 = (t103 + 4);
    *((unsigned int *)t103) = 1;
    *((unsigned int *)t109) = 1;
    goto LAB36;

LAB37:    t122 = *((unsigned int *)t110);
    t123 = *((unsigned int *)t116);
    *((unsigned int *)t110) = (t122 | t123);
    t124 = (t89 + 4);
    t125 = (t103 + 4);
    t126 = *((unsigned int *)t89);
    t127 = (~(t126));
    t128 = *((unsigned int *)t124);
    t129 = (~(t128));
    t130 = *((unsigned int *)t103);
    t131 = (~(t130));
    t132 = *((unsigned int *)t125);
    t133 = (~(t132));
    t134 = (t127 & t129);
    t135 = (t131 & t133);
    t136 = (~(t134));
    t137 = (~(t135));
    t138 = *((unsigned int *)t116);
    *((unsigned int *)t116) = (t138 & t136);
    t139 = *((unsigned int *)t116);
    *((unsigned int *)t116) = (t139 & t137);
    t140 = *((unsigned int *)t110);
    *((unsigned int *)t110) = (t140 & t136);
    t141 = *((unsigned int *)t110);
    *((unsigned int *)t110) = (t141 & t137);
    goto LAB39;

LAB40:    *((unsigned int *)t142) = 1;
    goto LAB43;

LAB42:    t149 = (t142 + 4);
    *((unsigned int *)t142) = 1;
    *((unsigned int *)t149) = 1;
    goto LAB43;

LAB44:    t155 = (t0 + 13848U);
    t156 = *((char **)t155);
    t155 = ((char*)((ng3)));
    memset(t157, 0, 8);
    t158 = (t156 + 4);
    t159 = (t155 + 4);
    t160 = *((unsigned int *)t156);
    t161 = *((unsigned int *)t155);
    t162 = (t160 ^ t161);
    t163 = *((unsigned int *)t158);
    t164 = *((unsigned int *)t159);
    t165 = (t163 ^ t164);
    t166 = (t162 | t165);
    t167 = *((unsigned int *)t158);
    t168 = *((unsigned int *)t159);
    t169 = (t167 | t168);
    t170 = (~(t169));
    t171 = (t166 & t170);
    if (t171 != 0)
        goto LAB50;

LAB47:    if (t169 != 0)
        goto LAB49;

LAB48:    *((unsigned int *)t157) = 1;

LAB50:    memset(t173, 0, 8);
    t174 = (t157 + 4);
    t175 = *((unsigned int *)t174);
    t176 = (~(t175));
    t177 = *((unsigned int *)t157);
    t178 = (t177 & t176);
    t179 = (t178 & 1U);
    if (t179 != 0)
        goto LAB51;

LAB52:    if (*((unsigned int *)t174) != 0)
        goto LAB53;

LAB54:    t181 = (t173 + 4);
    t182 = *((unsigned int *)t173);
    t183 = *((unsigned int *)t181);
    t184 = (t182 || t183);
    if (t184 > 0)
        goto LAB55;

LAB56:    memcpy(t211, t173, 8);

LAB57:    memset(t243, 0, 8);
    t244 = (t211 + 4);
    t245 = *((unsigned int *)t244);
    t246 = (~(t245));
    t247 = *((unsigned int *)t211);
    t248 = (t247 & t246);
    t249 = (t248 & 1U);
    if (t249 != 0)
        goto LAB69;

LAB70:    if (*((unsigned int *)t244) != 0)
        goto LAB71;

LAB72:    t252 = *((unsigned int *)t142);
    t253 = *((unsigned int *)t243);
    t254 = (t252 | t253);
    *((unsigned int *)t251) = t254;
    t255 = (t142 + 4);
    t256 = (t243 + 4);
    t257 = (t251 + 4);
    t258 = *((unsigned int *)t255);
    t259 = *((unsigned int *)t256);
    t260 = (t258 | t259);
    *((unsigned int *)t257) = t260;
    t261 = *((unsigned int *)t257);
    t262 = (t261 != 0);
    if (t262 == 1)
        goto LAB73;

LAB74:
LAB75:    goto LAB46;

LAB49:    t172 = (t157 + 4);
    *((unsigned int *)t157) = 1;
    *((unsigned int *)t172) = 1;
    goto LAB50;

LAB51:    *((unsigned int *)t173) = 1;
    goto LAB54;

LAB53:    t180 = (t173 + 4);
    *((unsigned int *)t173) = 1;
    *((unsigned int *)t180) = 1;
    goto LAB54;

LAB55:    t185 = (t0 + 3288U);
    t186 = *((char **)t185);
    t185 = ((char*)((ng1)));
    memset(t187, 0, 8);
    t188 = (t186 + 4);
    t189 = (t185 + 4);
    t190 = *((unsigned int *)t186);
    t191 = *((unsigned int *)t185);
    t192 = (t190 ^ t191);
    t193 = *((unsigned int *)t188);
    t194 = *((unsigned int *)t189);
    t195 = (t193 ^ t194);
    t196 = (t192 | t195);
    t197 = *((unsigned int *)t188);
    t198 = *((unsigned int *)t189);
    t199 = (t197 | t198);
    t200 = (~(t199));
    t201 = (t196 & t200);
    if (t201 != 0)
        goto LAB61;

LAB58:    if (t199 != 0)
        goto LAB60;

LAB59:    *((unsigned int *)t187) = 1;

LAB61:    memset(t203, 0, 8);
    t204 = (t187 + 4);
    t205 = *((unsigned int *)t204);
    t206 = (~(t205));
    t207 = *((unsigned int *)t187);
    t208 = (t207 & t206);
    t209 = (t208 & 1U);
    if (t209 != 0)
        goto LAB62;

LAB63:    if (*((unsigned int *)t204) != 0)
        goto LAB64;

LAB65:    t212 = *((unsigned int *)t173);
    t213 = *((unsigned int *)t203);
    t214 = (t212 & t213);
    *((unsigned int *)t211) = t214;
    t215 = (t173 + 4);
    t216 = (t203 + 4);
    t217 = (t211 + 4);
    t218 = *((unsigned int *)t215);
    t219 = *((unsigned int *)t216);
    t220 = (t218 | t219);
    *((unsigned int *)t217) = t220;
    t221 = *((unsigned int *)t217);
    t222 = (t221 != 0);
    if (t222 == 1)
        goto LAB66;

LAB67:
LAB68:    goto LAB57;

LAB60:    t202 = (t187 + 4);
    *((unsigned int *)t187) = 1;
    *((unsigned int *)t202) = 1;
    goto LAB61;

LAB62:    *((unsigned int *)t203) = 1;
    goto LAB65;

LAB64:    t210 = (t203 + 4);
    *((unsigned int *)t203) = 1;
    *((unsigned int *)t210) = 1;
    goto LAB65;

LAB66:    t223 = *((unsigned int *)t211);
    t224 = *((unsigned int *)t217);
    *((unsigned int *)t211) = (t223 | t224);
    t225 = (t173 + 4);
    t226 = (t203 + 4);
    t227 = *((unsigned int *)t173);
    t228 = (~(t227));
    t229 = *((unsigned int *)t225);
    t230 = (~(t229));
    t231 = *((unsigned int *)t203);
    t232 = (~(t231));
    t233 = *((unsigned int *)t226);
    t234 = (~(t233));
    t235 = (t228 & t230);
    t236 = (t232 & t234);
    t237 = (~(t235));
    t238 = (~(t236));
    t239 = *((unsigned int *)t217);
    *((unsigned int *)t217) = (t239 & t237);
    t240 = *((unsigned int *)t217);
    *((unsigned int *)t217) = (t240 & t238);
    t241 = *((unsigned int *)t211);
    *((unsigned int *)t211) = (t241 & t237);
    t242 = *((unsigned int *)t211);
    *((unsigned int *)t211) = (t242 & t238);
    goto LAB68;

LAB69:    *((unsigned int *)t243) = 1;
    goto LAB72;

LAB71:    t250 = (t243 + 4);
    *((unsigned int *)t243) = 1;
    *((unsigned int *)t250) = 1;
    goto LAB72;

LAB73:    t263 = *((unsigned int *)t251);
    t264 = *((unsigned int *)t257);
    *((unsigned int *)t251) = (t263 | t264);
    t265 = (t142 + 4);
    t266 = (t243 + 4);
    t267 = *((unsigned int *)t265);
    t268 = (~(t267));
    t269 = *((unsigned int *)t142);
    t270 = (t269 & t268);
    t271 = *((unsigned int *)t266);
    t272 = (~(t271));
    t273 = *((unsigned int *)t243);
    t274 = (t273 & t272);
    t275 = (~(t270));
    t276 = (~(t274));
    t277 = *((unsigned int *)t257);
    *((unsigned int *)t257) = (t277 & t275);
    t278 = *((unsigned int *)t257);
    *((unsigned int *)t257) = (t278 & t276);
    goto LAB75;

LAB76:    *((unsigned int *)t279) = 1;
    goto LAB79;

LAB78:    t286 = (t279 + 4);
    *((unsigned int *)t279) = 1;
    *((unsigned int *)t286) = 1;
    goto LAB79;

LAB80:    t292 = (t0 + 12408U);
    t293 = *((char **)t292);
    t292 = ((char*)((ng3)));
    memset(t294, 0, 8);
    t295 = (t293 + 4);
    t296 = (t292 + 4);
    t297 = *((unsigned int *)t293);
    t298 = *((unsigned int *)t292);
    t299 = (t297 ^ t298);
    t300 = *((unsigned int *)t295);
    t301 = *((unsigned int *)t296);
    t302 = (t300 ^ t301);
    t303 = (t299 | t302);
    t304 = *((unsigned int *)t295);
    t305 = *((unsigned int *)t296);
    t306 = (t304 | t305);
    t307 = (~(t306));
    t308 = (t303 & t307);
    if (t308 != 0)
        goto LAB86;

LAB83:    if (t306 != 0)
        goto LAB85;

LAB84:    *((unsigned int *)t294) = 1;

LAB86:    memset(t310, 0, 8);
    t311 = (t294 + 4);
    t312 = *((unsigned int *)t311);
    t313 = (~(t312));
    t314 = *((unsigned int *)t294);
    t315 = (t314 & t313);
    t316 = (t315 & 1U);
    if (t316 != 0)
        goto LAB87;

LAB88:    if (*((unsigned int *)t311) != 0)
        goto LAB89;

LAB90:    t319 = *((unsigned int *)t279);
    t320 = *((unsigned int *)t310);
    t321 = (t319 | t320);
    *((unsigned int *)t318) = t321;
    t322 = (t279 + 4);
    t323 = (t310 + 4);
    t324 = (t318 + 4);
    t325 = *((unsigned int *)t322);
    t326 = *((unsigned int *)t323);
    t327 = (t325 | t326);
    *((unsigned int *)t324) = t327;
    t328 = *((unsigned int *)t324);
    t329 = (t328 != 0);
    if (t329 == 1)
        goto LAB91;

LAB92:
LAB93:    goto LAB82;

LAB85:    t309 = (t294 + 4);
    *((unsigned int *)t294) = 1;
    *((unsigned int *)t309) = 1;
    goto LAB86;

LAB87:    *((unsigned int *)t310) = 1;
    goto LAB90;

LAB89:    t317 = (t310 + 4);
    *((unsigned int *)t310) = 1;
    *((unsigned int *)t317) = 1;
    goto LAB90;

LAB91:    t330 = *((unsigned int *)t318);
    t331 = *((unsigned int *)t324);
    *((unsigned int *)t318) = (t330 | t331);
    t332 = (t279 + 4);
    t333 = (t310 + 4);
    t334 = *((unsigned int *)t332);
    t335 = (~(t334));
    t336 = *((unsigned int *)t279);
    t337 = (t336 & t335);
    t338 = *((unsigned int *)t333);
    t339 = (~(t338));
    t340 = *((unsigned int *)t310);
    t341 = (t340 & t339);
    t342 = (~(t337));
    t343 = (~(t341));
    t344 = *((unsigned int *)t324);
    *((unsigned int *)t324) = (t344 & t342);
    t345 = *((unsigned int *)t324);
    *((unsigned int *)t324) = (t345 & t343);
    goto LAB93;

LAB94:    *((unsigned int *)t4) = 1;
    goto LAB97;

LAB96:    t352 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t352) = 1;
    goto LAB97;

LAB98:    t357 = ((char*)((ng2)));
    goto LAB99;

LAB100:    t362 = (t0 + 12248U);
    t363 = *((char **)t362);
    goto LAB101;

LAB102:    xsi_vlog_unsigned_bit_combine(t3, 32, t357, 32, t363, 32);
    goto LAB106;

LAB104:    memcpy(t3, t357, 8);
    goto LAB106;

}

static void Cont_183_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;

LAB0:    t1 = (t0 + 15664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(183, ng0);
    t2 = (t0 + 12408U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t39, 8);

LAB20:    t38 = (t0 + 16688);
    t40 = (t38 + 56U);
    t41 = *((char **)t40);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    memcpy(t43, t3, 8);
    xsi_driver_vfirst_trans(t38, 0, 31);
    t44 = (t0 + 16512);
    *((int *)t44) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng2)));
    goto LAB13;

LAB14:    t38 = (t0 + 13368U);
    t39 = *((char **)t38);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t33, 32, t39, 32);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

}

static void Cont_255_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t7[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;

LAB0:    t1 = (t0 + 15912U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(255, ng0);
    t2 = (t0 + 6168U);
    t5 = *((char **)t2);
    t2 = (t0 + 6328U);
    t6 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t5 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t2);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t2);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t7) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t7 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t7);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t38, 8);

LAB20:    t39 = (t0 + 16752);
    t40 = (t39 + 56U);
    t41 = *((char **)t40);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    memset(t43, 0, 8);
    t44 = 1U;
    t45 = t44;
    t46 = (t3 + 4);
    t47 = *((unsigned int *)t3);
    t44 = (t44 & t47);
    t48 = *((unsigned int *)t46);
    t45 = (t45 & t48);
    t49 = (t43 + 4);
    t50 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t50 | t44);
    t51 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t51 | t45);
    xsi_driver_vfirst_trans(t39, 0, 0);
    t52 = (t0 + 16528);
    *((int *)t52) = 1;

LAB1:    return;
LAB6:    t21 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng4)));
    goto LAB13;

LAB14:    t38 = ((char*)((ng2)));
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 1, t33, 1, t38, 1);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

}

static void Cont_356_4(char *t0)
{
    char t3[8];
    char t4[8];
    char t5[8];
    char t15[8];
    char t48[8];
    char t49[8];
    char t50[8];
    char t60[8];
    char t87[8];
    char *t1;
    char *t2;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    char *t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    char *t88;
    char *t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    char *t94;
    char *t95;
    char *t96;
    char *t97;
    char *t98;
    char *t99;
    char *t100;

LAB0:    t1 = (t0 + 16160U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(356, ng0);
    t2 = (t0 + 2808U);
    t6 = *((char **)t2);
    memset(t5, 0, 8);
    t2 = (t5 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 16);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 16);
    *((unsigned int *)t2) = t11;
    t12 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t12 & 65535U);
    t13 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t13 & 65535U);
    t14 = ((char*)((ng6)));
    memset(t15, 0, 8);
    t16 = (t5 + 4);
    t17 = (t14 + 4);
    t18 = *((unsigned int *)t5);
    t19 = *((unsigned int *)t14);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t16);
    t22 = *((unsigned int *)t17);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t16);
    t26 = *((unsigned int *)t17);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB5;

LAB4:    if (t27 != 0)
        goto LAB6;

LAB7:    memset(t4, 0, 8);
    t31 = (t15 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t15);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t31) != 0)
        goto LAB10;

LAB11:    t38 = (t4 + 4);
    t39 = *((unsigned int *)t4);
    t40 = *((unsigned int *)t38);
    t41 = (t39 || t40);
    if (t41 > 0)
        goto LAB12;

LAB13:    t44 = *((unsigned int *)t4);
    t45 = (~(t44));
    t46 = *((unsigned int *)t38);
    t47 = (t45 || t46);
    if (t47 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t38) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t48, 8);

LAB20:    t94 = (t0 + 16816);
    t96 = (t94 + 56U);
    t97 = *((char **)t96);
    t98 = (t97 + 56U);
    t99 = *((char **)t98);
    memcpy(t99, t3, 8);
    xsi_driver_vfirst_trans(t94, 0, 31);
    t100 = (t0 + 16544);
    *((int *)t100) = 1;

LAB1:    return;
LAB5:    *((unsigned int *)t15) = 1;
    goto LAB7;

LAB6:    t30 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t37 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t37) = 1;
    goto LAB11;

LAB12:    t42 = (t0 + 9208U);
    t43 = *((char **)t42);
    goto LAB13;

LAB14:    t42 = (t0 + 2808U);
    t51 = *((char **)t42);
    memset(t50, 0, 8);
    t42 = (t50 + 4);
    t52 = (t51 + 4);
    t53 = *((unsigned int *)t51);
    t54 = (t53 >> 0);
    *((unsigned int *)t50) = t54;
    t55 = *((unsigned int *)t52);
    t56 = (t55 >> 0);
    *((unsigned int *)t42) = t56;
    t57 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t57 & 31U);
    t58 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t58 & 31U);
    t59 = ((char*)((ng7)));
    memset(t60, 0, 8);
    t61 = (t50 + 4);
    t62 = (t59 + 4);
    t63 = *((unsigned int *)t50);
    t64 = *((unsigned int *)t59);
    t65 = (t63 ^ t64);
    t66 = *((unsigned int *)t61);
    t67 = *((unsigned int *)t62);
    t68 = (t66 ^ t67);
    t69 = (t65 | t68);
    t70 = *((unsigned int *)t61);
    t71 = *((unsigned int *)t62);
    t72 = (t70 | t71);
    t73 = (~(t72));
    t74 = (t69 & t73);
    if (t74 != 0)
        goto LAB24;

LAB21:    if (t72 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t60) = 1;

LAB24:    memset(t49, 0, 8);
    t76 = (t60 + 4);
    t77 = *((unsigned int *)t76);
    t78 = (~(t77));
    t79 = *((unsigned int *)t60);
    t80 = (t79 & t78);
    t81 = (t80 & 1U);
    if (t81 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t76) != 0)
        goto LAB27;

LAB28:    t83 = (t49 + 4);
    t84 = *((unsigned int *)t49);
    t85 = *((unsigned int *)t83);
    t86 = (t84 || t85);
    if (t86 > 0)
        goto LAB29;

LAB30:    t90 = *((unsigned int *)t49);
    t91 = (~(t90));
    t92 = *((unsigned int *)t83);
    t93 = (t91 || t92);
    if (t93 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t83) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t49) > 0)
        goto LAB35;

LAB36:    memcpy(t48, t95, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t43, 32, t48, 32);
    goto LAB20;

LAB18:    memcpy(t3, t43, 8);
    goto LAB20;

LAB23:    t75 = (t60 + 4);
    *((unsigned int *)t60) = 1;
    *((unsigned int *)t75) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t49) = 1;
    goto LAB28;

LAB27:    t82 = (t49 + 4);
    *((unsigned int *)t49) = 1;
    *((unsigned int *)t82) = 1;
    goto LAB28;

LAB29:    t88 = (t0 + 2488U);
    t89 = *((char **)t88);
    t88 = ((char*)((ng2)));
    xsi_vlogtype_concat(t87, 32, 32, 2U, t88, 24, t89, 8);
    goto LAB30;

LAB31:    t94 = (t0 + 2328U);
    t95 = *((char **)t94);
    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t48, 32, t87, 32, t95, 32);
    goto LAB37;

LAB35:    memcpy(t48, t87, 8);
    goto LAB37;

}


extern void work_m_00000000003996587009_3985901070_init()
{
	static char *pe[] = {(void *)Always_63_0,(void *)Cont_163_1,(void *)Cont_183_2,(void *)Cont_255_3,(void *)Cont_356_4};
	xsi_register_didat("work_m_00000000003996587009_3985901070", "isim/SCCPU_t_isim_beh.exe.sim/work/m_00000000003996587009_3985901070.didat");
	xsi_register_executes(pe);
}
