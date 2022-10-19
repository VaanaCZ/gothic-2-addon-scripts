// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lester_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_EXIT_Condition;
	information	= DIA_Lester_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Lester_Hello (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Hello_Condition;
	information	= DIA_Lester_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       
FUNC INT DIA_Lester_Hello_Condition()
{	
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Hello_Info()
{	
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self ,other,"DIA_Lester_Hello_13_00");	//Jsi to TY? - Opravdu! Chlape, ani netu��, jak r�d t� vid�m!

	Info_ClearChoices	(DIA_Lester_Hello);

	Info_AddChoice		(DIA_Lester_Hello, "M�l bych t� zn�t?" 					,DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice		(DIA_Lester_Hello, "Lestere! Jak ses sem dostal?"		,DIA_Lester_Hello_Lester);
};
FUNC VOID DIA_Lester_Hello_Lester()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_Lester_15_00");	//Lestere! Jak ses sem dostal?
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_01");	//Byl to ��len� �t�k. Kdy� bari�ra vybuchla, chv�li jsem se naprosto zmaten� toulal po okol�.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_02");	//Pak jsem se cel� dny sna�il probojovat skrz tyhle lesy, a� jsem kone�n� na�el tohle �dol�.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten a Gorn jsou po��d v Hornick�m �dol�. Aspo� si to mysl�m.
};
FUNC VOID DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_YouKnowMe_15_00");	//M�l bych t� zn�t?
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Hal�? Je n�kdo doma? Riskoval jsem vlastn� k��i, abys mohl dostat ten divn� k�men.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//N�co mi dlu��. TENTOKR�T by sis to m�l pamatovat.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_03"); 	//Pamatuje� je�t� na Diega, Miltena a Gorna?

	Info_AddChoice		(DIA_Lester_Hello, "Diego, Milten a KDO?" 	,DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice		(DIA_Lester_Hello, "Jasn�. Co je s nimi?"	,DIA_Lester_Hello_KnowFourFriends);

};
FUNC VOID DIA_Lester_Hello_KnowFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Jasn�. Co je s nimi?
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Pokud v�m, tak zni�en� bari�ry m�li p�e��t.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Nem�m pon�t�, kde jdou te� - v�ichni t�i je�t� nejsp� d�ep� n�kde v Hornick�m �dol�.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Kdybys na n� n�hodou narazil, dej mi v�d�t.
};
FUNC VOID DIA_Lester_Hello_WhoFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten a KDO?
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Nesna� se mi namluvit, �e si na to nepamatuje�. Ty ohniskov� kameny - ten trol - ta ohromn� kupa rudy vodn�ch m�g�?
	AI_Output	(other, self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Nejsem si jist�...
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//To p�ijde. I mn� chv�li trvalo, ne� jsem si to v�echno v hlav� srovnal.
};
// ************************************************************
// 		  				  Was ist passiert?		//E1
// ************************************************************
INSTANCE DIA_Lester_WhatHappened (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_WhatHappened_Condition;
	information	= DIA_Lester_WhatHappened_Info;
	permanent	= FALSE;
	description = "Co se stalo?";
};                       
FUNC INT DIA_Lester_WhatHappened_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_WhatHappened_Info()
{	
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_00");	//Co se stalo?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_01");	//Co byl Sp�� pora�en, cel� bratrstvo ztratilo hlavu.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_02");	//Bez v�dce byli jako pr�zdn� sko��pky.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_03");	//A ty? Co bylo s tebou?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_04");	//J� na tom byl �pln� stejn�. M�l jsem no�n� m�ry a dokonce halucinace. Ale jakmile jsem za�al v�ce m�n� p�em��let zase norm�ln�, utekl jsem.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_05");	//Jednou se mi zd�lo, �e vid�m obrovsk� �ern� st�n, jak vyrazil na skupinu uprchl�k� a sp�lil je na prach.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_06");	//V tu chv�li jsem si v�n� myslel, �e m� p�i�el zab�t drak.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_07");	//Vid�l jsi je�t� n�co?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_08");	//Ne - vzal jsem nohy na ramena a utekl!
};
// ************************************************************
// 		  				   Minental		 		//E1 
// ************************************************************
INSTANCE DIA_Lester_MineColony (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_MineColony_Condition;
	information	= DIA_Lester_MineColony_Info;
	permanent	= FALSE;
	description = "Jak dlouho se u� ukr�v� v tomhle �dol�?";
};                       
FUNC INT DIA_Lester_MineColony_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_MineColony_Info()
{	
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_00");	//Jak dlouho se u� ukr�v� v tomhle �dol�?
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_01");	//P�esn� to nev�m. Mo�n� t�den. Ale napad� m� je�t� jedna v�c:
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_02");	//Kdy� jsem sem jednoho ve�era p�i�el, pod�val jsem se na vrcholek hory - bylo tam jenom p�r strom�.
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_03");	//A kdy� jsem se tam pod�val druh� den r�no, st�la tam v�. P��sahal bych, �e tam p�edt�m nebyla. Od t� doby jsem z �dol� nevyt�hl paty.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_04");	//Mysl� Xardasovu v�? V�d�l jsem, �e je mocn�, ale vytvo�it v� jenom tak...
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_05");	//Nekromant Xardas? To on �ije v t� v�i? Nev�m, jestli se mi to dvakr�t zamlouv�.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_06");	//Uklidni se, byl to pr�v� on, kdo m� zachr�nil ze Sp��ova chr�mu. Je na na�� stran�.
};
///////////////////////////////////////////////////////////////////////
//	Info SEND_XARDAS
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_SEND_XARDAS		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_SEND_XARDAS_Condition;
	information	 = 	DIA_Lester_SEND_XARDAS_Info;
	permanent	 = 	FALSE;
	description	 = 	"O tom st�nu mus� pov�d�t Xardasovi...";
};
func int DIA_Lester_SEND_XARDAS_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Lester_WhatHappened)
	&& Npc_KnowsInfo (other,DIA_Lester_MineColony)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_SEND_XARDAS_Info ()
{
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_00"); //Mus� ��ct Xardasovi o tom st�nu, mohlo by to b�t d�le�it�.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_01"); //Ty si nemysl�, �e to byl jen v�plod moj� p�edstavivosti? To jako �e to doopravdy byl...
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_02"); //...drak. Ano.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_03"); //Zase se do toho pou�t� po hlav�, �e?
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_04"); //Ne�ekl bych, �e po hlav�... je�t� ne.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_05"); //(povzdychne si) No dobr�, kdy� je to tak d�le�it�, tak za n�m p�jdu - ale ne hned te�.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_06"); //Te� si chci odpo�inout. Je�t� po��d jsem �pln� vy�erpan� z toho �t�ku z trestaneck� kolonie.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_07"); //�ekl bych, �e m� velk� pl�ny. Uvid�me se pozd�ji u Xardase.
	
	AI_StopProcessInfos (self);
	
	//wird bei LOLO zu Xardas gebeamt
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_STADT		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_STADT_Condition;
	information	 = 	DIA_Addon_Lester_STADT_Info;

	description	 = 	"M�m nam��eno do KHORINIDU! Co bys mi o tom m�st� �ekl?";
};

func int DIA_Addon_Lester_STADT_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_STADT_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_00"); //M�m nam��eno do Khorinidu, v� o tom m�st� n�co zaj�mav�ho?
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_01"); //Khorinis? No, to je jen oby�ejn� p��stav, nic zvl�tn�ho.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_02"); //Pro� se pt�?
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_03"); //Mus�m zaj�t za paladiny, kte�� se pr� ve m�st� usadili.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_04"); //(sm�je se) V�n�? Haha! V�dy� t� nepust� ani do m�sta, nato� do paladinsk�ho s�dla!
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_Vorschlag		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_Vorschlag_Condition;
	information	 = 	DIA_Addon_Lester_Vorschlag_Info;

	description	 = 	"Napad� t�, jak bych se do m�sta nejl�pe dostal?";
};

func int DIA_Addon_Lester_Vorschlag_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lester_STADT))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_00"); //A nenapad� t�, jak bych se mohl do m�sta dostat?
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_01"); //Ur�it� jo. P�ed �asem jsem tam pracoval pro star�ho alchymistu Constantina.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_02"); //M� ve m�st� docela vliv a str�e maj� nak�z�no, �e maj� br�nou vpustit ka�d�ho, kdo mu bude moci prodat n�jak� vz�cn� byliny.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_03"); //Tak�e je to jednoduch�. Nasb�r� hromadu bylin, kter� tu v�ude rostou, bude� p�edst�rat, �e pracuje� pro Constantina, a tak se dostane� dovnit�.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_04"); //Ale ne abys sb�ral v�echno mo�n�. Str�e nejsou moc bystr� a o alchymii nemaj� ani p�ru.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_05"); //Pust� t� dovnit�, kdy� uvid� po��dnou hrom�dku n�jak� rostliny.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_06"); //Mysl�m, �e sta�� nasb�rat 10 kousk� od jednoho druhu.
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_07"); //D�ky za tip.
	
	Log_CreateTopic (TOPIC_Addon_PickForConstantino, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_PickForConstantino,"Lester tvrd�, �e p�es m�stsk� str�e se dostanu, ponesu-li aspo� 10 kousk� n�jak� byliny a �eknu jim, �e jsou ur�eny pro star�ho alchymistu Constantina."); 
	
	MIS_Addon_Lester_PickForConstantino = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info PASSAGEPLANTSSUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;

	description	 = 	"Ta v�c s bylinami pro Constantina fungovala p��mo z�zra�n�.";
};

func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition ()
{
	if (MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00"); //Ta v�c s bylinami pro Constantina fungovala jako kouzlo. Dostal jsem se tak kolem str��.
	AI_Output	(self, other, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01"); //Jak jsem �ekl. Ob�as bys m� mohl trochu poslouchat, p��teli.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 		  		Perm	
// ************************************************************
INSTANCE DIA_Lester_Perm (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Perm_Condition;
	information	= DIA_Lester_Perm_Info;
	permanent	= TRUE;
	description = "Co v� o tomhle m�st�?";
};                       
FUNC INT DIA_Lester_Perm_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_LESTER") <= 2000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Perm_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Perm_15_00");	//Co v� o tomhle m�st�?
	AI_Output	(self, other,"DIA_Lester_Perm_13_01");	//Kdy� p�jde� tudy dol�, dojde� na farmu. O kousek d�l u� za��n� m�sto.
	AI_Output	(self, other,"DIA_Lester_Perm_13_02");	//Ale bu� opatrn�. Nepotuluj� se tam jen vlci a krysy, ale tak� goblini a banditi!
};
// ************************************************************
// 		  		Sleep
// ************************************************************
INSTANCE DIA_Lester_Sleep (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Sleep_Condition;
	information	= DIA_Lester_Sleep_Info;
	permanent	= TRUE;
	description = "Je�t� po��d jsi unaven�?";
};                       
FUNC INT DIA_Lester_Sleep_Condition()
{
	if  (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_IN1_31") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Sleep_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Sleep_15_00");	//Je�t� po��d jsi unaven�?
	AI_Output	(self, other,"DIA_Lester_Sleep_13_01");	//A jak. (z�vne si) �ekl jsem Xardasovi v�echno. Te� se na chvilku prosp�m. Tak den...
	AI_Output	(self, other,"DIA_Lester_Sleep_13_02");	//dva... mo�n� d�le.
	
	AI_StopProcessInfos (self);
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Lester_KAP3_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP3_EXIT_Condition;
	information	= DIA_Lester_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BACKINTOWN
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_BACKINTOWN		(C_INFO) 
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_BACKINTOWN_Condition;
	information	 = 	DIA_Lester_BACKINTOWN_Info;
	important	 = 	TRUE;
};
func int DIA_Lester_BACKINTOWN_Condition ()
{	
	if (Npc_GetDistToWP (self, "LEVELCHANGE") <= 500) 
		&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_BACKINTOWN_Info ()
{
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_00"); //Hej, kone�n� ses vr�til! Mus� j�t okam�it� za Xardasem, m�me probl�m.
	AI_Output			(other, self, "DIA_Lester_BACKINTOWN_15_01"); //Tak tomu naprosto v���m.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_02"); //Co jsi ode�el, propuklo naprost� peklo.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_03"); //Promluv si s Xardasem, �ek� na tebe!
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_04"); //Xardas mi pro tebe dal tuhle runu. S jej� pomoc� se k n�mu dostane� rychleji. Setk�me se tam.
	
	CreateInvItems 		(self,ItRu_TeleportXardas,1);
	B_GiveInvItems 		(self,other,ItRu_TeleportXardas,1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");	//Joly: Lester geht wieder zur�ck in sein Tal!
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_PERM3		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	900;
	condition	 = 	DIA_Lester_PERM3_Condition;
	information	 = 	DIA_Lester_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nevypad� zrovna nad�en�.";
};

func int DIA_Lester_PERM3_Condition ()
{
	if (Kapitel >= 3)
	&& (Lester_IsOnBoard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

var int DIA_Lester_PERM3_OneTime;
func void DIA_Lester_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Lester_PERM3_15_00"); //Nevypad� zrovna nad�en�.
	
	if (hero.guild == GIL_KDF)
	{
		if (DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_01"); //Taky moc nad�en� nejsem, chlape. Jsem �pln� vy��zen� a po��d m� bol� hlava.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_02"); //Poka�d�, kdy� se objev� ty �ern� k�p�, tak se to zhor��.
			
			if (SC_KnowsMadPsi == TRUE)
				{
					AI_Output			(other, self, "DIA_Lester_PERM3_15_03"); //A j� ti m��u p�esn� ��ct, pro� to tak je.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_04"); //Jo? Mysl�m, �e to ani nechci v�d�t.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_05"); //Ty �ern� k�p� - neboli P�tra�i, jak jim ��k�me my m�gov� - b�vali p��vr�enci mocn�ho arcid�mona. Ne��k� ti to nic?
					AI_Output			(self, other, "DIA_Lester_PERM3_13_06"); //Hmm. Ne. Leda �e by ses mi sna�il nazna�it, �e...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_07"); //Ano, p�esn�. Ti P�tra�i byli p��vr�enci Sp��e. Odpadlick� sekta pomatenc� z t�bora v ba�in�ch.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_08"); //Je to tv�j b�val� lid, Lestere. B�val� bratrstvo Sp��e. Te� z nich jsou pouz� bezdu�� p�isluhova�i zla.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_09"); //Tu�il jsem to, ale doufal jsem, �e to nen� pravda. Chce� ��ct, �e se vr�til? Sp�� je zp�tky mezi n�mi?
					AI_Output			(other, self, "DIA_Lester_PERM3_15_10"); //Dobr� ot�zka. Jsem si jist� jenom t�m, �e mus�m P�tra�e zastavit d��v, ne� budou p��li� mocn�.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_11"); //Nel�b� se mi to, ale asi m� pravdu. Je mi l�to, ale tohle v�echno mi za��n� l�zt na mozek.
					B_LogEntry (TOPIC_DEMENTOREN,"M� podez�en� se potvrdila. Dokonce ani Lester u� nepochybuje, �e p�tra�i pat�� ke Sp��ov�m p�isluhova��m ze star�ho t�bora v ba�in�ch."); 
					B_GivePlayerXP (XP_Lester_KnowsMadPsi);
					DIA_Lester_PERM3_OneTime = TRUE;
				};
		};
	}
	else
	{
		if (Lester_IsOnBOard == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_12"); //Bolest hlavy jen tak neustoup�, ale doufejme, �e si jinak s t�m probl�mem dok�eme brzy poradit.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_13"); //A� tak nebo tak.
		}
		else if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_14"); //Ta bolest hlavy za��n� b�t nesnesiteln�. A te� na m� je�t� po��d �to�� ti je�t��i. Mus�m se s�m sebe pt�t, odkud se berou.
		}
		else
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_15"); //Ta bolest hlavy nechce p�ej�t. N�co se chyst�.
		};
	};
	AI_Output			(self, other, "DIA_Lester_PERM3_13_16"); //(povzdechne si) Mysl�m, �e si budu muset odpo�inout.
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Lester_KAP4_EXIT(C_INFO)
{
	npc		= PC_Psionic;
	nr		= 999;
	condition	= DIA_Lester_KAP4_EXIT_Condition;
	information	= DIA_Lester_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Lester_KAP5_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP5_EXIT_Condition;
	information	= DIA_Lester_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info XardasWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_XARDASWEG		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_XARDASWEG_Condition;
	information	 = 	DIA_Lester_XARDASWEG_Info;

	description	 = 	"Kde je Xardas?";
};

func int DIA_Lester_XARDASWEG_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info ()
{
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_00"); //Kde je Xardas?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_01"); //Je pry� a ve sv� v�i nechal ta d�monick� stvo�en�.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_02"); //Mysl�m, �e nechce, aby po jeho v�i v jeho nep��tomnosti n�kdo sl�dil.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_03"); //Kam �el?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_04"); //To ne��kal. Jenom m� po��dal, abych ti p�edal tenhle dopis.
	
	CreateInvItems 		(self, ItWr_XardasLetterToOpenBook_MIS, 1);					
	B_GiveInvItems 		(self, other, ItWr_XardasLetterToOpenBook_MIS,1);
	
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_05"); //P�e�etl jsem si ho. Omlouv�m se. Byl jsem zv�dav�.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_06"); //A?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_07"); //Nem�m pon�t�, nerozum�l jsem ani slovu, chlape. Ale jedno mi je jasn�: jen tak ho neuvid�me.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_08"); //Asi mu za�ala ho�et zem� za patama, a tak se vydal do kopc�.
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardas zmizel. Lester mi pouze p�edal dopis, kter� mi m�g zanechal."); 
};


///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lester_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Zjistil jsem, kde se ukr�v� nep��tel.";
};
func int DIA_Lester_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lester_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lester_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_00"); //Zjistil jsem, kde se ukr�v� nep��tel.
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_01"); //Neptej se m� pro�, ale m�m pocit, �e bych m�l j�t s tebou.
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_02"); //Co t�m mysl�?
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_03"); //Nedok�u to vysv�tlit, ale je mi jasn�, �e odpov�� se dozv�m, jen kdy� p�jdu s tebou.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lester_KnowWhereEnemy_15_04"); //Je mi l�to, ale lo� u� je pln�.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_05"); //Mo�n� je, mo�n� je m�j osud bezv�znamn� v porovn�n� s v�cmi, kter� jsou p�ed n�mi.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_06"); //S�m mus� v�d�t, co bys m�l ud�lat. Postav se zlu - se mnou si hlavu nel�mej.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_07"); //Nejsem nijak d�le�it�.
	}
	else 
	{
		Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Nemohu t� vz�t s sebou.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Tak poj� se mnou a najdi sv� odpov�di!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lester_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_00"); //Tak poj� se mnou a najdi sv� odpov�di!
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_01"); //Setk�me se v p��stavu. P�ijdu tam, jakmile budu p�ipraven.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02"); //Posp� si, za��n� n�s tla�it �as.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Lester_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};

FUNC VOID DIA_Lester_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_No_15_00"); //Nemohu t� vz�t s sebou.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_01"); //Rozum�m. Stejn� bych ti asi nebyl ��dnou v�raznou oporou.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_02"); //A� u� si vezme� s sebou kohokoliv, ujisti se, �e mu m��e� v��it.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_03"); //A d�vej na sebe pozor.

	Lester_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};


///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_LeaveMyShip_Condition;
	information	 = 	DIA_Lester_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Nakonec pro tebe p�ece jenom nem�m m�sto.";
};
func int DIA_Lester_LeaveMyShip_Condition ()
{	
	if (Lester_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lester_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lester_LeaveMyShip_15_00"); //Nakonec pro tebe p�ece jenom nem�m m�sto.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_01"); //Rozum�m ti. B�t ve tv� situaci, asi bych ud�lal to sam�.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_02"); //Kdybys m� pot�eboval, pomohu ti. V�, kde m� hledat.
	
	Lester_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_StillNeedYou_Condition;
	information	 = 	DIA_Lester_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Pot�ebuji p��tele, kter� by mi pomohl.";
};
func int DIA_Lester_StillNeedYou_Condition ()
{	
	if ((Lester_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man nat�rlich nur eine variable abfragen
	|| (Lester_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lester_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lester_StillNeedYou_15_00"); //Pot�ebuji p��tele, kter� by mi pomohl.
	
	if (Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_01"); //V�d�l jsem to! Projdeme t�m bok po boku, stejn� jako p�edt�m.
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_02"); //Zlo by se m�lo m�t na pozoru. Za��n�me mu �lapat na paty.
		
		self.flags 		 = NPC_FLAG_IMMORTAL;
		Lester_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_03"); //Nakonec bude p�ece jenom asi lep��, kdy� tady z�stanu. Hodn� �t�st�.
	
		AI_StopProcessInfos (self);
	};	
};

//#####################################################################
//##
//##
//##							KAPITEL 6 //auf der Dracheninsel ->Neue Instanz!!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Lester_KAP6_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP6_EXIT_Condition;
	information	= DIA_Lester_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_PC_Psionic_PICKPOCKET (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 900;
	condition	= DIA_PC_Psionic_PICKPOCKET_Condition;
	information	= DIA_PC_Psionic_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_PC_Psionic_PICKPOCKET_Condition()
{
	C_Beklauen (76, 20);
};
 
FUNC VOID DIA_PC_Psionic_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_BACK 		,DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};
	
func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};




































