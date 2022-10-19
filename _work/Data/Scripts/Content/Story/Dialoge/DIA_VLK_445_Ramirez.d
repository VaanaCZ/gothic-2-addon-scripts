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
	description = "(P�edv�st zlod�jsk� sign�l.)";
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
	AI_Output (self, other, "DIA_Ramirez_Zeichen_14_00");//Fajn, fajn, zn� sign�l. (z�v�) Docela m� to p�ekvapuje.
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
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_00");//Ztratil ses? Nemyslim si, �e tohle je to prav� m�sto pro tebe.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_01");//Jestli se ti tady n�co stane, nikdo z n�s ti pomoct nep�jde. Tak�e si d�vej bacha. (�irok� �sm�v)
	};
	if  (Join_Thiefs == TRUE)  
	{
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_02");//Tak pat�� k n�m. Dobr�, tak ti p�eju hodn� �t�st� - ale bu� opatrn�, a� u� d�l� cokoli.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_03");//A je�t� jedna v�c - je mi jedno, kdo jsi tam naho�e a s k�m pracuje�.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_04");//Tady dole jsi jen jedn�m z n�s. Zlod�j. Nic v�c, nic m��.
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
	AI_Output (self, other, "DIA_Ramirez_Beute_14_00");//Poslouchej, to nem��e� myslet v�n�, �e ne? Hrabe� se v na�em zlatu - to se n�s pokou�� okr�st?
	AI_Output (other, self, "DIA_Ramirez_Beute_15_01");//Ne��kej, �e za tu d�inu je jen t�chhle p�r minc�.
	AI_Output (other, self, "DIA_Ramirez_Beute_15_02");//Mysl�m, tahle hrom�dka tady - to je CEL� ko�ist? To je v�echno, co m� zlod�jsk� cech Khorinidu k dispozici?
	AI_Output (self, other, "DIA_Ramirez_Beute_14_03");//Kdo ��kal, �e tady dole m�me na�i ko�ist?
	AI_Output (other, self, "DIA_Ramirez_Beute_15_04");//Stejn� tomu nem��u uv��it. Tak kde jste schovali ty poklady?
	AI_Output (self, other, "DIA_Ramirez_Beute_14_05");//Na velmi bezpe�n� m�sto.
	AI_Output (other, self, "DIA_Ramirez_Beute_15_06");//Aha.
	AI_Output (self, other, "DIA_Ramirez_Beute_14_07");//Dobr�, m��e� si to zlato nechat. Ale budu na tebe d�vat pozor. Tak to nep�ep�skni.
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
	description	= "M��e� m� n��emu nau�it?";
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
		
	AI_Output (other, self, "DIA_Ramirez_Bezahlen_15_00");//M��e� m� n��emu nau�it?
	
	if (Npc_GetTalentSkill  (other, NPC_TALENT_PICKLOCK) == TRUE)
	{ 
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_14_01");//Nem��u t� nau�it nic. O p��en� z�mk� u� v� v�echno.
		if (other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output (self, other, "DIA_Ramirez_Add_14_00"); //Te� u� jen pot�ebuje� zdokonalit svou obratnost.
		};
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_14_02");//M��u ti uk�zat, jak p��it z�mky. Bude t� to st�t jen...
		B_Say_Gold (self, other, Ramirez_Cost);
		
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
		Info_AddChoice (DIA_Ramirez_Bezahlen,"Mo�n� pozd�ji. (ZP�T)",DIA_Ramirez_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Ramirez_Bezahlen,"OK, zaplat�m.",DIA_Ramirez_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Ramirez_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Ramirez_Bezahlen);
};
FUNC VOID DIA_Ramirez_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Ramirez_Bezahlen_Okay_15_00");//Dobr�, zaplat�m.
	
	if B_GiveInvItems (other, self, ItMi_Gold, Ramirez_Cost)
	{
		AI_Output (other, self, "DIA_Ramirez_Bezahlen_Okay_15_01");//Tady je zlato.
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_Okay_14_02");//V�born�. Jsem ti k slu�b�m.
		Ramirez_TeachPlayer = TRUE;
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_Okay_14_03");//Nejd��v si se�e� zlato a pak se vra�.
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
	description = "Nau� m� p��it z�mky!";
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
	AI_Output (other,self, "DIA_Ramirez_Teach_15_00");//Uka� mi, jak se p��� z�mky!
	
	if (Ramirez_Zweimal == FALSE)
	{
		AI_Output (self, other, "DIA_Ramirez_Teach_14_06");//P��en� z�mk� je zlod�jsk� um�n�.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_01");//Pot�ebuje� spoustu citu a intuice. A hromadu pakl���.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_02");//Ale pozor, n�kter� truhly maj� speci�ln� z�mky, kter� lze odemknout jen pomoc� odpov�daj�c�ho kl��e.
		Ramirez_Zweimal = TRUE;
	}
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other, "DIA_Ramirez_Teach_14_03");//Tak�e si klekne� p�ed z�mek a pakl��em ot��� napravo a nalevo.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_04");//Kdy� j�m oto�� moc rychle nebo moc siln�, zlom� se.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_05");//Ale ��m zku�en�j�� bude�, t�m pro tebe bude snaz�� s nimi zach�zet.
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
	description = "Kde to p��en� z�mk� stoj� za tu n�mahu?";
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
	AI_Output (other, self, "DIA_Ramirez_Viertel_15_00");//Kde to p��en� z�mk� stoj� za n�mahu?
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_01");//V horn� �tvrti, samoz�ejm�.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_02");//Ale jestli se tam bude� cht�t k n�komu vloupat, po�kej si na noc, a� v�ichni usnou - teda krom� str��.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_03");//Hl�dkuj� tam celou noc. Jednoho z nich zn�m - jmenuje se Wambo. On je jedinej, koho zaj�m� zlato.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_04");//Je drahej, ale kdy� mu jednou zaplat�, u� se o to nemus� d�l starat.
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
	description = "M� pro m� pr�ci?";
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
	AI_Output (other, self, "DIA_Ramirez_Sextant_15_00");//M� pro m� pr�ci?
	AI_Output (self, other, "DIA_Ramirez_Sextant_14_01");//Hmm... je tu jedna v�ci�ka, kterou bych r�d m�l. Ale zat�m jsem ji nena�el.
	AI_Output (other, self, "DIA_Ramirez_Sextant_15_02");//Co to je?
	AI_Output (self, other, "DIA_Ramirez_Sextant_14_03");//�hlom�r. P�ines mi sextant - d�m ti za n�j dobrou cenu.
	
	Log_CreateTopic (Topic_RamirezSextant,LOG_MISSION);
	Log_SetTopicStatus (Topic_RamirezSextant, LOG_RUNNING);
	B_LogEntry (Topic_RamirezSextant, "Ramirez m� po��dal, abych mu p�inesl sextant.");
	
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
	description = "M�m pro tebe ten sextant.";
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
	AI_Output (other, self, "DIA_Ramirez_Success_15_00");//M�m pro tebe ten sextant.
	B_GiveInvItems (other, self, Itmi_Sextant,1);
	AI_Output (self, other, "DIA_Ramirez_Success_14_01");//To nen� mo�n�. V�n� se ti povedlo n�jak� naj�t.
	AI_Output (self, other, "DIA_Ramirez_Success_14_02");//Tady, ty pen�ze si v�n� zaslou��.
	
	B_GiveInvItems (self, other, Itmi_Gold,Value_Sextant/2);
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	B_GivePlayerXP (XP_RamirezSextant);
};


