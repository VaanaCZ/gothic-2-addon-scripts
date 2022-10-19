// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Garett_EXIT(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 999;
	condition	= DIA_Addon_Garett_EXIT_Condition;
	information	= DIA_Addon_Garett_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Garett_PICKPOCKET (C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 900;
	condition	= DIA_Addon_Garett_PICKPOCKET_Condition;
	information	= DIA_Addon_Garett_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Garett_PICKPOCKET_Condition()
{
	C_Beklauen (36, 55);
};
 
FUNC VOID DIA_Addon_Garett_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
	
func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
INSTANCE DIA_Addon_Garett_Anheuern(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Anheuern_Condition;
	information	= DIA_Addon_Garett_Anheuern_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Anheuern_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Anheuern_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_00"); //A� t� ani nenapadne, �e by ses cht�l p�idat k na�emu odd�lu.
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_01"); //Co si mysl�, �e budou ostatn� d�lat, a� budu pry�, co?
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_02"); //A� se vr�t�m, nezbude v m� chajd� ani jedin� bedna!
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_03"); //Tak�e tu rad�i z�stanu a budu hl�dat na�e z�soby.
};

// ************************************************************
// 	 				   Hello 
// ************************************************************
INSTANCE DIA_Addon_Garett_Hello(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Hello_Condition;
	information	= DIA_Addon_Garett_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Hello_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_00"); //A hele, kohopak to tu m�me? N�kdo novej, a douf�m, �e nepat�� k t�m zatrolenejm bandit�m.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_01"); //Jsem Garett. Kdy� bude� n�co pot�ebovat, jsem ten pravej.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_02"); //M�m na sklad� skoro v�ecko � v�no, zbran� a spoustu dal��ch v�c�, kter� by se ti mohly hodit.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_03"); //Krom� ko�alky � pro pit� mus� zaj�t za Samuelem.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
	
};

// ************************************************************
// 	 				  		Samuel 
// ************************************************************
INSTANCE DIA_Addon_Garett_Samuel(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 2;
	condition	= DIA_Addon_Garett_Samuel_Condition;
	information	= DIA_Addon_Garett_Samuel_Info;
	permanent	= FALSE;
	description = "Kdo je Samuel?";
};                       
FUNC INT DIA_Addon_Garett_Samuel_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello))
	&& (Samuel.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Samuel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Samuel_15_00"); //Kdo je Samuel?
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_01"); //N� pali�. �ije v jeskyni na pl�i, kousek d�l od t�bora.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_02"); //Nem��e� to minout � sta�� j�t na sever.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_03"); //Hlavn� by ses m�l z�sobit ko�alkou.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_04"); //Jsou tu lidi, co si moc nepotrp� na zelen��e, abych tak �ek.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_05"); //Po��dnej dou�ek ko�alky dok�e z�zraky!

	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 	 				   		Waren
// ************************************************************
INSTANCE DIA_Addon_Garett_Warez(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Warez_Condition;
	information	= DIA_Addon_Garett_Warez_Info;

	description = "Odkud bere� z�soby?";
};                       
FUNC INT DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Garett_Warez_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Warez_15_00"); //Kde jsi sv� z�soby z�skal?
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_01"); //Kdy� Skip jede do Khorinidu, v�dycky p�iveze hromadu z�sob.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_02"); //Doned�vna ��st prod�val p��mo bandit�m.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_03"); //Ale od t� doby, co s nima v�l��me, chod� v�ecko zbo�� mn�.
};

// ************************************************************
// 	 				   		Banditen
// ************************************************************
INSTANCE DIA_Addon_Garett_Bandits(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Bandits_Condition;
	information	= DIA_Addon_Garett_Bandits_Info;

	description = "Co v� o banditech?";
};                       
FUNC INT DIA_Addon_Garett_Bandits_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Garett_Bandits_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Bandits_15_00"); //Co v� o banditech?
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_01"); //Na to se rad�i zeptej Skipa.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_02"); //Ten s tou bandou str�vil spoustu �asu, to ti pov�m.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_03"); //Greg n�m nak�zal, abysme odd�lali ka�d�ho banditu, kterej se uk�e pobl� t�bora.
};



// ************************************************************
// ***														***
// 						Greg + Kompass
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 	 				  		Greg 
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Greg(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 4;
	condition	= DIA_Addon_Garett_Greg_Condition;
	information	= DIA_Addon_Garett_Greg_Info;
	permanent	= FALSE;
	description = "Jak� je ten tv�j kapit�n Greg?";
};                       
FUNC INT DIA_Addon_Garett_Greg_Condition ()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_Greg_Info()
{	
	AI_Output (other, self, "DIA_Addon_Garett_Greg_15_00"); //Jak� je ten v� kapit�n Greg?
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_01"); //Je to o�lehanej mo�skej vlk, vo tom nen� pochyb.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_02"); //A taky hrabivost sama.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_03"); //Nut� sv�ho pokladn�ka Francise vyb�rat tolik, �e je�t� p�r gro�� nav�c a m�l by na krku vzpouru.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_04"); //A kdy� n�kdo z n�s naraz� na n�co FAKT cenn�ho, nekompromisn� si to zabav� pro sebe.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_05"); //Jednou jsem na jedn� kr�lovsk� fregat� �majznul kompas.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_06"); //A ten �mejd Greg m� pochopiteln� donutil, abych mu ho dal.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_07"); //Pche! Nejsp� ho n�kde zakopal, i se svejma ostatn�ma pokladama.
};

// ------------------------------------------------------------
// 	 				  		Wo Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Tips(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 5;
	condition	= DIA_Addon_Garett_Tips_Condition;
	information	= DIA_Addon_Garett_Tips_Info;

	description = "Kde mohl Greg zakopat ten kompas?";
};                       
FUNC INT DIA_Addon_Garett_Tips_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Tips_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_00"); //Kam Greg mohl ten kompas zakopat?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_01"); //Jednou mi vypr�v�l, �e m�j kompas hl�d� samotn� smrt. A pak sa sm�l.
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_02"); //Je�t� n�co?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_03"); //Na ji�n�m pob�e�� je pl�, kam se d� dostat jedin� z mo�e.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_04"); //Greg tam pr� �asto pob�v�. Mo�n� tam n�co najde�.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_05"); //Jednou jsem se tam �el mrknout, jako �e bych t�eba n�co na�el s�m. Jen�e se to tem hem�� v�elijakejma potvorama.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_06"); //Jestli to chce� v�n� zkusit, nezapome� si vz�t krump��.
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_Kompass,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kompass,"Greg ukradl Garretovi vz�cn� kompas a zakopal ho kdesi na ji�n� pl�i.");
};

// ------------------------------------------------------------
// 	 						Bring Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_GiveKompass(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 6;
	condition	= DIA_Addon_Garett_GiveKompass_Condition;
	information	= DIA_Addon_Garett_GiveKompass_Info;
	permanent	= FALSE;
	description = "Tady m� ten kompas.";
};                       
FUNC INT DIA_Addon_Garett_GiveKompass_Condition()
{
	if (Npc_HasItems (other,ItMI_Addon_Kompass_Mis) >= 1)
	&& (MIS_Addon_Garett_BringKompass == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Addon_Garett_GiveKompass_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_GiveKompass_15_00"); //Tady m� ten sv�j kompas.
	
	//Patch m.f. - weil H�ndler
	if B_GiveInvItems (other,self,ItMI_Addon_Kompass_Mis,1)
	{
		Npc_RemoveInvItems (self, ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_01"); //(��astn�) Jo, to je on! U� jsem nedoufal, �e ho znova uvid�m.
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_02"); //D�ky, chlape!
	
	if (Npc_HasItems (self, ItBE_Addon_Prot_EdgPoi) > 0)
	{ 
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_03"); //Tentokr�t u� ho Greg nedostane!
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_04"); //Tum�, vem si na opl�tku tenhle opasek. Je to nejcenn�j��, co m�m.
		B_GiveInvItems (self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_05"); //Tenhle p�sek si ode m� koupil, pamatuje�?
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_06"); //A zaplatils za n�j spoustu pen�z � (rychle) v�c, ne� za kolik st�l. Tak si vem aspo� zp�tky sv� zlato.
		B_GiveInvItems (self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};
	
	B_LogEntry (TOPIC_Addon_Kompass,"Garret m�l velkou radost, �e jsem mu vr�til kompas.");
	MIS_Addon_Garett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP (XP_ADDON_Garett_Bring_Kompass);
};

// ************************************************************
// 	 				  			Francis 
// ************************************************************
INSTANCE DIA_Addon_Garett_Francis(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 7;
	condition	= DIA_Addon_Garett_Francis_Condition;
	information	= DIA_Addon_Garett_Francis_Info;
	permanent	= FALSE;
	description = "Co bys mi �ekl o Francisovi?";
};                       
FUNC INT DIA_Addon_Garett_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Francis_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Francis_15_00"); //Co bys mi �ekl o Francisovi?
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_01"); //Greg mu p�edal velen�, dokud bude pry�.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_02"); //Ale Francis je jako velitel tot�ln� neschopnej!
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_03"); //Nedonut� ani Morgana, aby zvednul ten sv�j l�nej zadek z postele.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_04"); //Henry a jeho chlapi jsou jedin�, kte�� tu n�co d�laj.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_05"); //Ostatn� se m�sto mak�n� jen v�lej.
	if (GregIsBack == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_06"); //M��u jen doufat, �e se Greg brzo vr�t�.
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_07"); //A v�ecky je po��dn� nakope do prdele.
	};
};

// ************************************************************
// 								PERM
// ************************************************************
INSTANCE DIA_Addon_Garett_PERM   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 99;
	condition   = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent   = TRUE;
	description = "N�co nov�ho?";
};
FUNC INT DIA_Addon_Garett_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garett_PERM_Info()
{
	AI_Output (other,self ,"DIA_Addon_Garett_PERM_15_00"); //Copak je nov�ho?
	
	if (GregIsBack == FALSE)
	|| (Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_02"); //Od Gregova odchodu se tu nic moc ned�lo.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_01"); //Kdy� se te� Greg vr�til, v�ecko u� zase za��n� j�t tak, jak m�.
	};
};

// ************************************************************
// 								Trade
// ************************************************************
INSTANCE DIA_Addon_Garett_Trade   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 888;
	condition   = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent   = TRUE;
	description = DIALOG_TRADE;
	trade		= TRUE;
};
FUNC INT DIA_Addon_Garett_Trade_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random; 	Garett_Random = Hlp_Random (3); 
	if Garett_Random == 0
	{
		B_Say (other,self,"$TRADE_1");
	}
	else if Garett_Random == 1
	{
		B_Say (other,self,"$TRADE_2");
	}
	else
	{
		B_Say (other,self,"$TRADE_3");
	};	
		
	B_GiveTradeInv (self);
	
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
};


