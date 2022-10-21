// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Rock_Exit_Condition;
	information	= DIA_Dragon_Rock_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Rock_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Rock_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Rock_Exit_20_00"); //Dost �e��. Tv� do�asn� moc vypr�ela. Oko ztratilo svou s�lu. P�iprav se na smrt.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Rock_Hello_Condition;
	information	= DIA_Dragon_Rock_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Rock_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Rock_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Rock_Hello_20_00"); //Dal�� troufal� stvo�en�, co se odv�ilo vyl�zt do m�ch skal. Ty mr�av� �lov��ku. Tak state�n� a z�rove� tak zraniteln�.
	if (Mis_KilledDragons == 0)
	{
		AI_Output			(other, self, "DIA_Dragon_Rock_Hello_15_01"); //Hej, v�n� um� mluvit.
	};
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_02"); //Vyrvu ti z t�la vnit�nosti a nad�l�m z nich krmen� pro krysy.
	AI_Output (other, self, "DIA_Dragon_Rock_Add_15_00"); //Ne tak rychle. M�m u sebe Innosovo oko. Bude� m� muset poslouchat a odpov�dat na m� ot�zky.
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_04"); //(�ve) Arrh. Ptej se.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Rock_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Rock_WERBISTDU_Info;

	description	 = 	"Kdo jsi?";
};

func int DIA_Dragon_Rock_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_WERBISTDU_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Dragon_Rock_WERBISTDU_20_01"); //Jsem naz�v�n Pedrakhanem a st�hnu z tebe k��i za�iva, a� t� chyt�m.

};


///////////////////////////////////////////////////////////////////////
//	Info Hierarchie
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_HIERARCHIE		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Rock_HIERARCHIE_Condition;
	information	 = 	DIA_Dragon_Rock_HIERARCHIE_Info;

	description	 = 	"Kdo je mezi draky nejsiln�j��?";
};

func int DIA_Dragon_Rock_HIERARCHIE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_HIERARCHIE_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_HIERARCHIE_15_00"); //Kdo je mezi draky ten nejsiln�j��?
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_01"); //�erp�me svou s�lu z element� tohoto sv�ta. Jejich hierarchie je jasn� a jednoduch�.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_02"); //Zem�, kterou pokr�v� m�kk� p�da, poskytla �ivot v�em stvo�en�m pod sluncem. Te� se otev�e a v�echny v�s pohlt�, pokud se dostanete p��li� bl�zko.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_03"); //Sk�ly, je� by se rad�ji rozpadly, ne� by se vzdaly, se py�n� ty�� k nebi a schov�vaj� samy p�ed sebou jistou nedbalost. A je�t� poskytuj� nejlep�� ochranu proti p��livu.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_04"); //Jisk�i�ka �ivota d��m� v ��ru hlubin tohoto sv�ta. A te� plameny sp�l� v�e �iv� a nez�stane nic ne� popel.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_05"); //V�echny na�e elementy dok�� chr�nit i ni�it. Ale pouze ve vod�, kter� se m��e st�t tvrdou a pevnou jako sk�la, se v�e p�em�n� na v��nou nehybnost, kde je �ivot st�� mo�n�.

};


//**********************************************************************************
//		B_AssignDragonTalk_Rock
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Rock (var c_NPC slf)
{
	DIA_Dragon_Rock_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};






