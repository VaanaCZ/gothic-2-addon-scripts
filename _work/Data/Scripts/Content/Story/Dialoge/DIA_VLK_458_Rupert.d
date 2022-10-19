// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Rupert_EXIT(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 999;
	condition	= DIA_Rupert_EXIT_Condition;
	information	= DIA_Rupert_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rupert_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rupert_PICKPOCKET (C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 900;
	condition	= DIA_Rupert_PICKPOCKET_Condition;
	information	= DIA_Rupert_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rupert_PICKPOCKET_Condition()
{
	C_Beklauen (18, 10);
};
 
FUNC VOID DIA_Rupert_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rupert_PICKPOCKET);
	Info_AddChoice		(DIA_Rupert_PICKPOCKET, DIALOG_BACK 		,DIA_Rupert_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rupert_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rupert_PICKPOCKET_DoIt);
};

func void DIA_Rupert_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rupert_PICKPOCKET);
};
	
func void DIA_Rupert_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rupert_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Rupert_Hello(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_Hello_Condition;
	information	= DIA_Rupert_Hello_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Rupert_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Rupert_Hello_03_00"); //Hal�, cizin�e!
	AI_Output (self ,other,"DIA_Rupert_Hello_03_01"); //Mus� m�t po��dn� hlad a ��ze� - mohl bych ti snad uk�zat sv� zbo��?
};	

// ************************************************************
// 			  				 Zu Pal 
// ************************************************************
INSTANCE DIA_Rupert_ZuPal(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_ZuPal_Condition;
	information	= DIA_Rupert_ZuPal_Info;
	permanent	= FALSE;
	description = "Pot�ebuju si promluvit s paladiny...";
};                       
FUNC INT DIA_Rupert_ZuPal_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_ZuPal_Info()
{	
	AI_Output (other, self,"DIA_Rupert_ZuPal_15_00"); //Pot�ebuju si promluvit s paladiny.
	AI_Output (self ,other,"DIA_Rupert_ZuPal_03_01"); //Tak to m� jen malou nad�ji. Od t� doby, co paladinov� zabrali horn� ��st m�sta, se tam jen tak n�kdo nedostane.
};	

// ************************************************************
// 			  			HelpMeIntoOV
// ************************************************************
INSTANCE DIA_Rupert_HelpMeIntoOV(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_HelpMeIntoOV_Condition;
	information	= DIA_Rupert_HelpMeIntoOV_Info;
	permanent	= FALSE;
	description = "M��e� mi pomoci proniknout do horn� �tvrti?";
};                       
FUNC INT DIA_Rupert_HelpMeIntoOV_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rupert_ZuPal))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_HelpMeIntoOV_Info()
{	
	AI_Output (other, self,"DIA_Rupert_HelpMeIntoOV_15_00"); //M��e� mi pomoci proniknout do horn� �tvrti?
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_01"); //J�? Ne, nem�m tady p��li� velk� slovo.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_02"); //V doln� ��sti m�sta je jen p�r lid�, kte�� maj� dostate�n� vliv, aby se dostali p�es str�e.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_03"); //Matteo, m�j p�n, je jedn�m z nich. Mo�n� by sis s n�m m�l promluvit.
	
	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Jestli se m�m dostat do horn� �tvrti, mus� mi v tom pomoci n�jac� vlivn� ob�an� z doln� ��sti m�sta.");
	B_LogEntry (TOPIC_OV,"Jedn�m z vlivn�ch ob�an� doln� ��sti m�sta je obchodn�k Matteo.");
};	

// ***************************************************************
//							WoMatteo
// ***************************************************************
INSTANCE DIA_Rupert_WoMatteo(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_WoMatteo_Condition;
	information	= DIA_Rupert_WoMatteo_Info;
	permanent	= FALSE;
	description = "Kde najdu Mattea?";
};                      
FUNC INT DIA_Rupert_WoMatteo_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_WoMatteo_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_WoMatteo_15_00"); //Kde najdu Mattea?
	AI_Output (self ,other,"DIA_Rupert_WoMatteo_03_01"); //Stoj� p��mo p�ed jeho kr�mkem. Sta�� jen vej�t. Je tam skoro po��d.
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Matte�v obchod le�� u ji�n� m�stsk� br�ny. Prod�v� vybaven�, zbran� i potraviny.");
		Knows_Matteo = TRUE;
	};
};

// ***************************************************************
//							Wer hat Einflu�
// ***************************************************************
INSTANCE DIA_Rupert_WerEinfluss(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 2;
	condition	= DIA_Rupert_WerEinfluss_Condition;
	information	= DIA_Rupert_WerEinfluss_Info;
	permanent	= FALSE;
	description = "A co ti ostatn� vlivn� m��an�?";
};                      
FUNC INT DIA_Rupert_WerEinfluss_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_WerEinfluss_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_WerEinfluss_15_00"); //A co ti ostatn� vlivn� m��an�?
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_01"); //Obchodn�ci a mistr tesa� tady na hlavn� ulici jsou nejvlivn�j��mi osobami ve m�st�.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_02"); //M�l by ses pokusit o p�ijet� za u�edn�ka u jednoho z nich - jako j�.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_03"); //Od t� doby, co pracuju pro Mattea, se ke mn� lid� ve m�st� chovaj� s �ctou!
	
	B_LogEntry (TOPIC_OV,"M�l bych vstoupit do u�en� k n�kter�mu z m�stn�ch �emeslnick�ch mistr�.");
};

// ***************************************************************
//							Work
// ***************************************************************
INSTANCE DIA_Rupert_Work(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 3;
	condition	= DIA_Rupert_Work_Condition;
	information	= DIA_Rupert_Work_Info;
	permanent	= FALSE;
	description = "Pot�ebuju trochu pen�z a poohl��m se po pr�ci.";
};                      
FUNC INT DIA_Rupert_Work_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_Work_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Work_15_00"); //Pot�ebuju trochu pen�z a poohl��m se po pr�ci.
	AI_Output (self ,other,"DIA_Rupert_Work_03_01"); //Sly�el jsem, �e m� probl�my se sv�m n�stupcem. Jeho d�lna je p��mo naproti.
	AI_Output (self ,other,"DIA_Rupert_Work_03_02"); //��k� se, �e plat� velice slu�n�.
};

// ***************************************************************
//							YourOffer
// ***************************************************************
INSTANCE DIA_Rupert_YourOffer(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_YourOffer_Condition;
	information	= DIA_Rupert_YourOffer_Info;
	permanent	= FALSE;
	description = "Co mi m��e� nab�dnout?";
};                      
FUNC INT DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_YourOffer_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_YourOffer_15_00"); //Co m� na prodej?
	AI_Output (self ,other,"DIA_Rupert_YourOffer_03_01"); //Te� zrovna nem�m moc velk� v�b�r.
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{ 
		AI_Output (self ,other,"DIA_Rupert_YourOffer_03_02"); //Ten zatracenej velkostatk�� u� nechce d�l doru�ovat sv� zbo�� a to, co z�sk�me od mal�ch statk���, nesta�� pokr�t po�adavky m�sta ani n�hodou.
	};
};

// ************************************************************
//								Trade
// ************************************************************
INSTANCE DIA_Rupert_Trade(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 900;
	condition	= DIA_Rupert_Trade_Condition;
	information	= DIA_Rupert_Trade_Info;
	permanent	= TRUE;
	description = "Uka� mi sv� zbo��.";
	trade		= TRUE;
};                       
FUNC INT DIA_Rupert_Trade_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_YourOffer))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_Trade_Info()
{	
	if (Npc_HasItems (self, itfo_cheese) < 5)
	{
		CreateInvItems (self, ItFo_cheese, 5);
	};
	
	AI_Output (other,self ,"DIA_Rupert_Trade_15_00"); //Uka� mi sv� zbo��.
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_Rupert_Trade_03_01"); //Mus�m t� po��dat o shov�vavost nad mou chudou nab�dkou. �lov�k tv�ho postaven� je ur�it� zvykl� na lep��.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
INSTANCE DIA_Rupert_Bauernaufstand(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_Bauernaufstand_Condition;
	information	= DIA_Rupert_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "�ekni mi o t� rolnick� vzpou�e v�c.";
};                       
FUNC INT DIA_Rupert_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Rupert_YourOffer))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Bauernaufstand_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Bauernaufstand_15_00"); //�ekni mi o t� rolnick� vzpou�e v�c.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_01"); //To je docela jednoduch�: velkostatk�� Onar u� nechce d�l m�stu odv�d�t dan�.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_02"); //No jen si to p�edstav! Jsme ve v�lce se sk�ety a ten tlustej lenoch chce v�echno jen pro sebe!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_03"); //Norm�ln� by v takov�ch p��padech domobrana sjednala po��dek.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_04"); //Ale te� p�ich�z� to nejlep��: ��k� se, �e Onar najal �old�ky, aby dr�eli voj�ky z m�sta na uzd�!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_05"); //�OLD�CI! Cel� tahle v�c skon�� n�jakou zatracenou v�lkou! Jako kdyby JEDNA v�lka nesta�ila!
};

// ***************************************************************
//							S�ldner
// ***************************************************************
INSTANCE DIA_Rupert_Mercs(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_Mercs_Condition;
	information	= DIA_Rupert_Mercs_Info;
	permanent	= FALSE;
	description = "Co v� o Onarov�ch �oldn���ch?";
};                       
FUNC INT DIA_Rupert_Mercs_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Rupert_Bauernaufstand))
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Mercs_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Mercs_15_00"); //Co v� o Onarov�ch �oldn���ch?
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_01"); //Zaslechl jsem, �e v�t�inou se jedn� o b�val� v�zn� z hornick� kolonie.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_02"); //A jejich velitel m�l �dajn� bejt n�jak� velk� zv��e z kr�lova okol� - gener�l nebo co, kter�ho potrestali za zradu!
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_03"); //Jsou te� stra�n� �asy.
};



