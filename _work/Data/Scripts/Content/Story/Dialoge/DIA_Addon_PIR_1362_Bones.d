// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bones_EXIT(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 999;
	condition	= DIA_Addon_Bones_EXIT_Condition;
	information	= DIA_Addon_Bones_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bones_PICKPOCKET (C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 900;
	condition	= DIA_Addon_Bones_PICKPOCKET_Condition;
	information	= DIA_Addon_Bones_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bones_PICKPOCKET_Condition()
{
	C_Beklauen (75, 104);
};
 
FUNC VOID DIA_Addon_Bones_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
	
func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
func void B_Addon_Bones_KeineZeit()
{
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_01"); //Je mi l�to, ale te� nem�m �as.
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_02"); //Mus�m cvi�it.
};
// -------------------------------------------------------------
INSTANCE DIA_Addon_Bones_Anheuern(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 1;
	condition	= DIA_Addon_Bones_Anheuern_Condition;
	information	= DIA_Addon_Bones_Anheuern_Info;

	description = "Ka�on �ek�.";
};                       
FUNC INT DIA_Addon_Bones_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bones_Anheuern_Info()
{	
	AI_Output	(other, self, "DIA_Addon_Bones_Anheuern_15_01"); //Ka�on �ek�.
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Bones_Hello(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Hello_Condition;
	information	= DIA_Addon_Bones_Hello_Info;
	permanent	= FALSE;
	description = "Jak se vede?";
};                       
FUNC INT DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Hello_15_00"); //Jak to jde?
	AI_Output (self ,other,"DIA_Addon_Bones_Hello_01_01"); //Nem��u si st�ovat. Trochu nuda, ale aspo� nemus�m makat.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_01"); //Chyst�m se na dal�� �kol, kter� mi zadal Greg.
	AI_Output (other,self ,"DIA_Addon_Bones_Work_15_02"); //Jakej �kol?
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_03"); //To nesm�m ��ct.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_04"); //Nic ve zl�m, hochu. Ale j� si to privilegium dost tvrd� vyd�el a u� ho nechci ztratit.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  			Kannst du mir was beibringen? 
// ************************************************************
INSTANCE DIA_Addon_Bones_Train(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Train_Condition;
	information	= DIA_Addon_Bones_Train_Info;
	permanent	= FALSE;
	description = "M��e� m� n��emu nau�it?";
};                       
FUNC INT DIA_Addon_Bones_Train_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_Train_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Train_15_00"); //M��e� m� n�co nau�it?
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  			Wo finde ich Lehrer
// ************************************************************
INSTANCE DIA_Addon_Bones_Teacher(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Teacher_Condition;
	information	= DIA_Addon_Bones_Teacher_Info;
	permanent	= FALSE;
	description = "Kdo by m� tu tak n�co nau�il?";
};                       
FUNC INT DIA_Addon_Bones_Teacher_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Bones_Teacher_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_00"); //Kdo by m� tu n�co nau�il?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_04"); //Henry a Morgan vedou na�e p�epadov� odd�ly.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_05"); //M��ou t� nau�it l�p bojovat.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_07"); //V�ichni Henryho lidi bojujou s obouru�n�ma zbran�ma.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_08"); //Morgan m� zas rad�i rychlej�� jednoru�ky.
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_09"); //Kdo d�l?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_10"); //Nev�m, vo nic jin�ho jsem se nikdy nezaj�mal.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_11"); //Ale p�r trik� by t� ur�it� nau�il i Krokod�l Jack nebo Samuel.
	Knows_HenrysEntertrupp = TRUE;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);

};

// ************************************************************
// 			  			Was wei�t du �ber Francis?
// ************************************************************
INSTANCE DIA_Addon_Bones_Francis(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 3;
	condition	= DIA_Addon_Bones_Francis_Condition;
	information	= DIA_Addon_Bones_Francis_Info;
	permanent	= FALSE;
	description = "M��e� mi prozradit n�co o Francisovi?";
};                       
FUNC INT DIA_Addon_Bones_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Bones_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Francis_15_00"); //M��e� mi ��ct n�co o Francisovi?
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_03"); //Jen se kolem sebe rozhl�dni. Jedinej, kdo tu mak�, je Henry a jeho lidi.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_04"); //Morgan se cel� dny v�l� v posteli nebo nas�v� jak houba.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_05"); //A na Grega nezkou�ej ��dn� nesmysly � jestli se nebude� dr�et v lati, nakope ti zadek.
};

//*********************************************************
//	BDT Armor
//*********************************************************
instance DIA_Addon_Bones_WantArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_WantArmor_Condition;
	information	= DIA_Addon_Bones_WantArmor_Info;
	permanent	= TRUE;
	description = "Dej mi tu zbroj bandit�.";
};                       
FUNC INT DIA_Addon_Bones_WantArmor_Condition()
{
	if (Greg_GaveArmorToBones == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Bones_WantArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_WantArmor_15_00"); //Dej mi tu zbroj bandit�.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_01"); //Takovej bl�zen nejsem. Greg by mi utrhnul hlavu.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_02"); //V�slovn� �ek, �e tu zbroj nikdo nedostane, pokud to von vosobn� nena��d�.
	if (GregIsBack == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_03"); //Nem��u ti ji d�t. Zvl᚝ kdy� se Greg je�t� nevr�til.
	};
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bones mi ned� zbroj, dokud mu to nepovol� Greg."); 
};

//*********************************************************
//	Du sollst mir die R�stung geben.
//*********************************************************
instance DIA_Addon_Bones_GiveArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_GiveArmor_Condition;
	information	= DIA_Addon_Bones_GiveArmor_Info;
	permanent	= FALSE;
	description = "M� mi d�t zbroj bandit�. Rozkaz od Grega.";
};                       
FUNC INT DIA_Addon_Bones_GiveArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_GiveArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_00"); //M� mi d�t brn�n� bandit�. Rozkaz p��mo od Grega.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_01"); //Od Grega? No, u� jsem myslel, �e tam budu muset j�t j�.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_02"); //D�lat �pi�na v t�bo�e bandit� je p�kn� o dr�ku.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_03"); //Rad�i bych Gregovi ukl�zel v chatr�i, ne� abych se nechal zab�t vod bandit�.
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_04"); //(roz�ilen�) A co ta zbroj?
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_05"); //No jo, jasn�, tady je.
	B_GiveInvItems (self,other,ItAr_BDT_M,1);
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_06"); //Ale bu� vopatrnej, ti banditi jsou p�kn� ch�tra.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Rozkaz od Grega dok�zal nemo�n�: nyn� m�m zbroj bandit�!"); 
	
	B_GivePlayerXP (XP_Bones_GetBDTArmor);
};

