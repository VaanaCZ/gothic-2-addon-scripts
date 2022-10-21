//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_EXIT   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 999;
	condition   = DIA_Ramirez_EXIT_Condition;
	information = DIA_Ramirez_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ramirez_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ramirez_PICKPOCKET (C_INFO)
{
	npc			= VLK_445_Ramirez;
	nr			= 900;
	condition	= DIA_Ramirez_PICKPOCKET_Condition;
	information	= DIA_Ramirez_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Ramirez_PICKPOCKET_Condition()
{
	C_Beklauen (90, 300);
};
 
FUNC VOID DIA_Ramirez_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ramirez_PICKPOCKET);
	Info_AddChoice		(DIA_Ramirez_PICKPOCKET, DIALOG_BACK 		,DIA_Ramirez_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ramirez_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ramirez_PICKPOCKET_DoIt);
};

func void DIA_Ramirez_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ramirez_PICKPOCKET);
};
	
func void DIA_Ramirez_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ramirez_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Zeichen   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Zeichen_Condition;
	information = DIA_Ramirez_Zeichen_Info;
	permanent   = FALSE;
	description = "(P¯edvÈst zlodÏjsk˝ sign·l.)";
};

FUNC INT DIA_Ramirez_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Ramirez_Zeichen_14_00");//Fajn, fajn, zn·ö sign·l. (zÌv·) Docela mÏ to p¯ekvapuje.
};

//////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Hallo   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Hallo_Condition;
	information = DIA_Ramirez_Hallo_Info;
	permanent   = TRUE;
	important	= TRUE;
};
//----------------------------------
var int DIA_Ramirez_Hallo_permanent;
//----------------------------------
FUNC INT DIA_Ramirez_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Ramirez_Hallo_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Hallo_Info()
{
	if (self.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Join_Thiefs == FALSE) 
	{
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_00");//Ztratil ses? Nemyslim si, ûe tohle je to prav˝ mÌsto pro tebe.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_01");//Jestli se ti tady nÏco stane, nikdo z n·s ti pomoct nep˘jde. Takûe si d·vej bacha. (öirok˝ ˙smÏv)
	};
	if  (Join_Thiefs == TRUE)  
	{
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_02");//Tak pat¯Ìö k n·m. Dobr·, tak ti p¯eju hodnÏ ötÏstÌ - ale buÔ opatrn˝, aù uû dÏl·ö cokoli.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_03");//A jeötÏ jedna vÏc - je mi jedno, kdo jsi tam naho¯e a s k˝m pracujeö.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_04");//Tady dole jsi jen jednÌm z n·s. ZlodÏj. Nic vÌc, nic mÌÚ.
		DIA_Ramirez_Hallo_permanent = TRUE;
	};
	
	DG_gefunden = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Beute
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Beute   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 3;
	condition   = DIA_Ramirez_Beute_Condition;
	information = DIA_Ramirez_Beute_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Ramirez_Beute_Condition()
{
	if ((Mob_HasItems ("THIEF_CHEST_01",ItMi_Gold) < 50)
	|| (Mob_HasItems  ("THIEF_CHEST_02",ItMi_Gold) < 100)
	|| (Mob_HasItems  ("THIEF_CHEST_02",ItMi_Silvercup) == FALSE)
	|| (Mob_HasItems  ("THIEF_CHEST_03",ItMi_Gold) < 75))
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Beute_Info()
{
	AI_Output (self, other, "DIA_Ramirez_Beute_14_00");//Poslouchej, to nem˘ûeö myslet v·ûnÏ, ûe ne? Hrabeö se v naöem zlatu - to se n·s pokouöÌö okr·st?
	AI_Output (other, self, "DIA_Ramirez_Beute_15_01");//Ne¯Ìkej, ûe za tu d¯inu je jen tÏchhle p·r mincÌ.
	AI_Output (other, self, "DIA_Ramirez_Beute_15_02");//MyslÌm, tahle hrom·dka tady - to je CEL¡ ko¯ist? To je vöechno, co m· zlodÏjsk˝ cech Khorinidu k dispozici?
	AI_Output (self, other, "DIA_Ramirez_Beute_14_03");//Kdo ¯Ìkal, ûe tady dole m·me naöi ko¯ist?
	AI_Output (other, self, "DIA_Ramirez_Beute_15_04");//StejnÏ tomu nem˘ûu uvÏ¯it. Tak kde jste schovali ty poklady?
	AI_Output (self, other, "DIA_Ramirez_Beute_14_05");//Na velmi bezpeËnÈ mÌsto.
	AI_Output (other, self, "DIA_Ramirez_Beute_15_06");//Aha.
	AI_Output (self, other, "DIA_Ramirez_Beute_14_07");//Dobr·, m˘ûeö si to zlato nechat. Ale budu na tebe d·vat pozor. Tak to nep¯epÌskni.
};
//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Bezahlen   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 9;
	condition   = DIA_Ramirez_Bezahlen_Condition;
	information = DIA_Ramirez_Bezahlen_Info;
	permanent   = TRUE;
	description	= "M˘ûeö mÏ nÏËemu nauËit?";
};
//--------------------------------------
var int DIA_Ramirez_Bezahlen_permanent;
//--------------------------------------
FUNC INT DIA_Ramirez_Bezahlen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (DIA_Ramirez_Bezahlen_permanent == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Bezahlen_Info()
{	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		Ramirez_Cost = 150;
	}
	else 
	{
		Ramirez_Cost = 300;
	};	
		
	AI_Output (other, self, "DIA_Ramirez_Bezahlen_15_00");//M˘ûeö mÏ nÏËemu nauËit?
	
	if (Npc_GetTalentSkill  (other, NPC_TALENT_PICKLOCK) == TRUE)
	{ 
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_14_01");//Nem˘ûu tÏ nauËit nic. O p·ËenÌ z·mk˘ uû vÌö vöechno.
		if (other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output (self, other, "DIA_Ramirez_Add_14_00"); //TeÔ uû jen pot¯ebujeö zdokonalit svou obratnost.
		};
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_14_02");//M˘ûu ti uk·zat, jak p·Ëit z·mky. Bude tÏ to st·t jen...
		B_Say_Gold (self, other, Ramirez_Cost);
		
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
		Info_AddChoice (DIA_Ramirez_Bezahlen,"Moûn· pozdÏji. (ZPÃT)",DIA_Ramirez_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Ramirez_Bezahlen,"OK, zaplatÌm.",DIA_Ramirez_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Ramirez_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Ramirez_Bezahlen);
};
FUNC VOID DIA_Ramirez_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Ramirez_Bezahlen_Okay_15_00");//Dobr·, zaplatÌm.
	
	if B_GiveInvItems (other, self, ItMi_Gold, Ramirez_Cost)
	{
		AI_Output (other, self, "DIA_Ramirez_Bezahlen_Okay_15_01");//Tady je zlato.
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_Okay_14_02");//V˝bornÏ. Jsem ti k sluûb·m.
		Ramirez_TeachPlayer = TRUE;
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_Okay_14_03");//Nejd¯Ìv si seûeÚ zlato a pak se vraù.
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	};

};
//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Teach   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 99;
	condition   = DIA_Ramirez_Teach_Condition;
	information = DIA_Ramirez_Teach_Info;
	permanent   = TRUE;
	description = "NauË mÏ p·Ëit z·mky!";
};

FUNC INT DIA_Ramirez_Teach_Condition()
{	
	if (Ramirez_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill  (other, NPC_TALENT_PICKLOCK) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Teach_Info()
{
	AI_Output (other,self, "DIA_Ramirez_Teach_15_00");//Ukaû mi, jak se p·ËÌ z·mky!
	
	if (Ramirez_Zweimal == FALSE)
	{
		AI_Output (self, other, "DIA_Ramirez_Teach_14_06");//P·ËenÌ z·mk˘ je zlodÏjskÈ umÏnÌ.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_01");//Pot¯ebujeö spoustu citu a intuice. A hromadu paklÌË˘.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_02");//Ale pozor, nÏkterÈ truhly majÌ speci·lnÌ z·mky, kterÈ lze odemknout jen pomocÌ odpovÌdajÌcÌho klÌËe.
		Ramirez_Zweimal = TRUE;
	}
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other, "DIA_Ramirez_Teach_14_03");//Takûe si klekneö p¯ed z·mek a paklÌËem ot·ËÌö napravo a nalevo.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_04");//Kdyû jÌm otoËÌö moc rychle nebo moc silnÏ, zlomÌ se.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_05");//Ale ËÌm zkuöenÏjöÌ budeö, tÌm pro tebe bude snazöÌ s nimi zach·zet.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info oberes Viertel
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Viertel   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 8;
	condition   = DIA_Ramirez_Viertel_Condition;
	information = DIA_Ramirez_Viertel_Info;
	permanent   = FALSE;
	description = "Kde to p·ËenÌ z·mk˘ stojÌ za tu n·mahu?";
};
FUNC INT DIA_Ramirez_Viertel_Condition()
{
	if (Knows_SecretSign == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Viertel_Info()
{	
	AI_Output (other, self, "DIA_Ramirez_Viertel_15_00");//Kde to p·ËenÌ z·mk˘ stojÌ za n·mahu?
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_01");//V hornÌ Ëtvrti, samoz¯ejmÏ.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_02");//Ale jestli se tam budeö chtÌt k nÏkomu vloupat, poËkej si na noc, aû vöichni usnou - teda kromÏ str·ûÌ.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_03");//HlÌdkujÌ tam celou noc. Jednoho z nich zn·m - jmenuje se Wambo. On je jedinej, koho zajÌm· zlato.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_04");//Je drahej, ale kdyû mu jednou zaplatÌö, uû se o to nemusÌö d·l starat.
};
///////////////////////////////////////////////////////////////////////
//	Info Sextant
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Sextant   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Sextant_Condition;
	information = DIA_Ramirez_Sextant_Info;
	permanent   = FALSE;
	description = "M·ö pro mÏ pr·ci?";
};

FUNC INT DIA_Ramirez_Sextant_Condition()
{
	if (Knows_SecretSign == TRUE)
	&& (MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Sextant_Info()
{
	AI_Output (other, self, "DIA_Ramirez_Sextant_15_00");//M·ö pro mÏ pr·ci?
	AI_Output (self, other, "DIA_Ramirez_Sextant_14_01");//Hmm... je tu jedna vÏciËka, kterou bych r·d mÏl. Ale zatÌm jsem ji nenaöel.
	AI_Output (other, self, "DIA_Ramirez_Sextant_15_02");//Co to je?
	AI_Output (self, other, "DIA_Ramirez_Sextant_14_03");//⁄hlomÏr. P¯ines mi sextant - d·m ti za nÏj dobrou cenu.
	
	Log_CreateTopic (Topic_RamirezSextant,LOG_MISSION);
	Log_SetTopicStatus (Topic_RamirezSextant, LOG_RUNNING);
	B_LogEntry (Topic_RamirezSextant, "Ramirez mÏ poû·dal, abych mu p¯inesl sextant.");
	
	MIS_RamirezSextant = LOG_RUNNING;
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Success   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Success_Condition;
	information = DIA_Ramirez_Success_Info;
	permanent   = FALSE;
	description = "M·m pro tebe ten sextant.";
};

FUNC INT DIA_Ramirez_Success_Condition()
{
	if Npc_KnowsInfo (other, DIA_Ramirez_Sextant)
	&& (Npc_HasItems (other, Itmi_Sextant ) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Success_Info()
{
	AI_Output (other, self, "DIA_Ramirez_Success_15_00");//M·m pro tebe ten sextant.
	B_GiveInvItems (other, self, Itmi_Sextant,1);
	AI_Output (self, other, "DIA_Ramirez_Success_14_01");//To nenÌ moûn˝. V·ûnÏ se ti povedlo nÏjak˝ najÌt.
	AI_Output (self, other, "DIA_Ramirez_Success_14_02");//Tady, ty penÌze si v·ûnÏ zaslouûÌö.
	
	B_GiveInvItems (self, other, Itmi_Gold,Value_Sextant/2);
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	B_GivePlayerXP (XP_RamirezSextant);
};


