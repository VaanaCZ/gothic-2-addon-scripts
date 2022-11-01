//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_EXIT   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 999;
	condition   = DIA_Jesper_EXIT_Condition;
	information = DIA_Jesper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Jesper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Jesper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jesper_PICKPOCKET (C_INFO)
{
	npc			= VLK_446_Jesper;
	nr			= 900;
	condition	= DIA_Jesper_PICKPOCKET_Condition;
	information	= DIA_Jesper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Jesper_PICKPOCKET_Condition()
{
	C_Beklauen (80, 180);
};
 
FUNC VOID DIA_Jesper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jesper_PICKPOCKET);
	Info_AddChoice		(DIA_Jesper_PICKPOCKET, DIALOG_BACK 		,DIA_Jesper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jesper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jesper_PICKPOCKET_DoIt);
};

func void DIA_Jesper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jesper_PICKPOCKET);
};
	
func void DIA_Jesper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jesper_PICKPOCKET);
};
//////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Hallo   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 1;
	condition   = DIA_Jesper_Hallo_Condition;
	information = DIA_Jesper_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Jesper_Hallo_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Jesper_Hallo_Info()
{
	AI_Output (self, other,"DIA_Jesper_Hallo_09_00");//Hej, co tam dole dęláš? Tady není nic pro tebe.
	AI_Output (self, other,"DIA_Jesper_Hallo_09_01");//Tak ven s tím, co tady dęláš?
		
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Pâišel jsem tę zabít.",DIA_Jesper_Hallo_Kill);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Jen jsem se tu chtęl trochu rozhlídnout.",DIA_Jesper_Hallo_NurSo);
		
	if  (Attila_Key == TRUE)
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Attila mi dal klíč...",DIA_Jesper_Hallo_Willkommen);
	}	
	else 
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Attilu už jsem oddęlal...",DIA_Jesper_Hallo_Umgelegt);
	};
	
	DG_gefunden = TRUE;
	
};
FUNC VOID DIA_Jesper_Hallo_Kill()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Kill_15_00");//Pâišel jsem tę zabít.
	AI_Output (self, other,"DIA_Jesper_Hallo_Kill_09_01");//To je ale skvęlý nápad. Na to jsi pâišel úplnę sám, co? No co. Zkrátíme to.
	
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Jesper_Hallo_NurSo()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_NurSo_15_00");//Jen jsem se tu chtęl trochu rozhlídnout.
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_01");//Tady není nic k vidęní. Šlapeš po moc nebezpečný půdę, rozumíš?
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_02");//Takže nech svoji zbraŕ, kde je, a âekni mi, proč jsi tady.
};
FUNC VOID DIA_Jesper_Hallo_Willkommen()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Willkommen_15_00");//Attila mi dal klíč. Proto jsem tady. Tak co ode mę chceš?
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_01");//To bys chtęl vędęt? Klídek.
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_02");//Bęž se podívat na Cassiu. Už na tebe čeká.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Umgelegt_15_00");//Sejmul jsem Attilu. Męl u sebe klíč od stok.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_01");//(nevęâícnę) TY jsi zabil Attilu?! (opovržlivę) No co, stejnę to byl jen prašivej pes.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_02");//Ale nęco ti âeknu. Jestli mę napadneš, zabiju tę.
	
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Co tady dęláš...",DIA_Jesper_Hallo_Was);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Vezmi mę ke svému vůdci.",DIA_Jesper_Hallo_Anfuehrer);
};
FUNC VOID DIA_Jesper_Hallo_Was()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Was_15_00");//Co dęláš v týhle tmavý vlhký díâe?
	AI_Output (self, other,"DIA_Jesper_Hallo_Was_09_01");//(zavrčí) Bydlím tady. Ještę jedna pitomá otázka a nadęlám ti z kůže ozdobný tâásničky.
};
FUNC VOID DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Anfuehrer_15_00");//Vezmi mę ke svému vůdci.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_01");//(oplzlý smích) HA - můj vůdce? Jsem si jistej, že s tebou Cassia bude chtít mluvit.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_02");//Pokračuj - a žádný srandičky.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Bezahlen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 1;
	condition   = DIA_Jesper_Bezahlen_Condition;
	information = DIA_Jesper_Bezahlen_Info;
	permanent   = TRUE;
	description	= "Můžeš mę nęčemu naučit?";
};
FUNC INT DIA_Jesper_Bezahlen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (Jesper_TeachSneak == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	&& (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Info()
{	
	AI_Output (other, self, "DIA_Jesper_Bezahlen_15_00");//Můžeš mę nęčemu naučit?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_01");//Jasnę, ukážu ti, jak se plížit - pro tebe zadarmo.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_02");//Chceš se naučit, jak se pohybovat tak, aby tę nikdo neslyšel? Bude tę to stát 100 zlatých.
		B_Say_Gold (self, other, Jesper_Cost);
		
		Info_ClearChoices (DIA_Jesper_Bezahlen);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Možná pozdęji. (ZPĘT)",DIA_Jesper_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Fajn, chci se naučit plížení (zaplatit 100 zlaăáků).",DIA_Jesper_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Jesper_Bezahlen);
};
FUNC VOID DIA_Jesper_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_00");//Dobrá, chci se naučit plížit.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_01");//Tady je zlato.
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_02");//Tak mi âekni, až budeš pâipraven.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_03");//Bez zlata se nemůžeš naučit nic.
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Schleichen 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Schleichen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Schleichen_Condition;
	information = DIA_Jesper_Schleichen_Info;
	permanent   = TRUE;
	description = "Nauč mę prosím, jak se skrývat.";
};
//--------------------------------------
var int DIA_Jesper_Schleichen_permanent;
//-------------------------------------- 
FUNC INT DIA_Jesper_Schleichen_Condition()
{	
	if (Jesper_TeachSneak == TRUE) 
	&& (DIA_Jesper_Schleichen_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Schleichen_Info()
{
	AI_Output (other, self, "DIA_Jesper_Schleichen_15_00");//Nauč mę umęní plížení.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK)
	{
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_01");//Plížení je pro každého zlodęje nepostradatelné. Pâedevším když si potâebuješ prohlédnout dům nękoho jiného.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_02");//Prostę tam nemůžeš dupat jak stádo slonů. Vętšina lidí má velmi lehký spánek.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_03");//Jedinę když se plížíš, tak tę nikdo neuslyší - a můžeš nerušenę pracovat.
		DIA_Jesper_Schleichen_permanent = TRUE;
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Freunde getötet
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Killer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 2;
	condition   = DIA_Jesper_Killer_Condition;
	information = DIA_Jesper_Killer_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Jesper_Killer_Condition()
{	
	if Npc_IsDead (Cassia)
	|| Npc_IsDead (Ramirez)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Killer_Info()
{
	if  Npc_IsDead (Cassia)
	&&  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_00");//Zabil jsi mé pâátele. Proč jsi to udęlal, ty vrahu?
		AI_Output (self, other, "DIA_Jesper_Killer_09_01");//Pošlu tę pâímo na návštęvu za Beliarem.
	}
	else if Npc_IsDead (Cassia)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_02");//Zabil jsi Cassiu, ty špinavej vrahu. Ale na mę si nepâijdeš!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	}
	else if  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_03");//Udęlal jsem pro Ramireze víc práce a vydęlal víc penęz, než ty kdy uvidíš.
		AI_Output (self, other, "DIA_Jesper_Killer_09_04");//A tys ho jen tak zabil, ty prašivej pse! Je čas vyrovnat účty!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	};
	
};
//////////////////////////////////////////////////////////////////////
//	Info Bogen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Bogen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Bogen_Condition;
	information = DIA_Jesper_Bogen_Info;
	permanent   = FALSE;
	description = "Hele, co víš o Bosperovę luku?";
};

FUNC INT DIA_Jesper_Bogen_Condition()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) < 1)
	&& (MIS_Bosper_Bogen == LOG_RUNNING)
	&& (Join_Thiefs == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Bogen_Info()
{
	AI_Output (other, self, "DIA_Jesper_Luk_15_00");//Hele, co víš o Bosperovę luku?
	AI_Output (self, other, "DIA_Jesper_Luk_09_01");//Myslíš ten luk od šípaâe? Jo, mám ho nękde zahrabanej nahoâe v truhle.
	AI_Output (self, other, "DIA_Jesper_Luk_09_02");//Ale pobíhá tam kolem spousta krys. Můžeš si pro nęj dojít, jestli ti ty potvory nevadęj.
	AI_Output (self, other, "DIA_Jesper_Luk_09_03");//Ta truhla je pochopitelnę zamčená. Musíš se do ní vloupat. (chechtá se) S trochou štęstí ti budou tvoje paklíče stačit.
	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_01");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_02");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_03");
};
//////////////////////////////////////////////////////////////////////
//	Info Tür
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Tuer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Tuer_Condition;
	information = DIA_Jesper_Tuer_Info;
	permanent   = FALSE;
	description = "Co je za tęmi zamčenými dveâmi?";
};

FUNC INT DIA_Jesper_Tuer_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Tuer_Info()
{
	AI_Output (other, self, "DIA_Jesper_Tuer_15_00");//Co je za tęmi zamčenými dveâmi?
	AI_Output (self, other, "DIA_Jesper_Tuer_09_01");//(chechtá se) Je za nima ta truhla - truhla mistra zámečníka.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_02");//Opatâil ji tak neuvęâitelnę složitým zámkem, že ji ještę nikdo nedokázal otevâít.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_03");//Bohužel byl zatčen - hodili ho skrz bariéru, kde asi vypustil duši.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_04");//Ale jestli se chceš pokusit tu truhlu otevâít, tady je klíč od pokoje.
	
	B_GiveInvItems (self, other, ItKe_Fingers,1);
};
//////////////////////////////////////////////////////////////////////
//	Info Truhe
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Truhe   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Truhe_Condition;
	information = DIA_Jesper_Truhe_Info;
	permanent   = FALSE;
	description = "Podaâilo se mi tu truhlu otevâít.";
};

FUNC INT DIA_Jesper_Truhe_Condition()
{	
	if (Mob_HasItems ("MOB_FINGERS", Itmi_Gold) < 300)
	|| (Mob_HasItems ("MOB_FINGERS", Itmi_Silvercup) < 5)
	|| (Mob_HasItems ("MOB_FINGERS", Itmi_Goldcup) < 1)
	|| (Mob_HasItems ("MOB_FINGERS", ItAM_Strg_01) < 1)
	|| (Mob_HasItems ("MOB_FINGERS", ItPO_perm_Dex) < 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Truhe_Info()
{
	AI_Output (other, self, "DIA_Jesper_Truhe_15_00");//Podaâilo se mi tu truhlu otevâít.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_01");//To není možné! Tak se zdá, že máme nového mistra zámečníka.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_02");//K takovému výkonu ti musím pogratulovat.
	
	B_GivePlayerXP (XP_JesperTruhe);
};  


