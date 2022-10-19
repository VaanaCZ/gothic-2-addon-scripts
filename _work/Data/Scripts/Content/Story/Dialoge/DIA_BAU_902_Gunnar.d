// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gunnar_EXIT   (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 999;
	condition   = DIA_Gunnar_EXIT_Condition;
	information = DIA_Gunnar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gunnar_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gunnar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo 
// ************************************************************
var int Gunnar_HalloGesagt;
// ------------------------

INSTANCE DIA_Gunnar_Hallo   (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 1;
	condition   = DIA_Gunnar_Hallo_Condition;
	information = DIA_Gunnar_Hallo_Info;
	permanent   = TRUE;
	description = "Jak to jde?";
};
FUNC INT DIA_Gunnar_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gunnar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Hallo_15_00"); //Co se stalo?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_01"); //Od té doby, co Onar vyhlásil, že si najal žoldnéâe, poflakuje se na dvoâe akorát tak banda nièemných darebákù.
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_02"); //Všechna ta chátra, co nemêla co do huby, se vyrojila z lesa ještê pâed tím, než jsme sem pâišli my.
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_03"); //Ty bastardi vážnê vylejzaj snad odevšad.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_04"); //Tak ty seš teë taky žoldák, hm?
	};	
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_05"); //Innos s tebou!
	};
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_06"); //Tady nejsou lidi z mêsta vítáni.
	};
	
	Gunnar_HalloGesagt = TRUE;
};

// ************************************************************
// 			  				  Everywhere 
// ************************************************************
INSTANCE DIA_Gunnar_Everywhere   (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 2;
	condition   = DIA_Gunnar_Everywhere_Condition;
	information = DIA_Gunnar_Everywhere_Info;
	permanent   = TRUE;
	description = "Kde se tu vzalo tolik žoldnéâù?";
};
FUNC INT DIA_Gunnar_Everywhere_Condition()
{
	if (Gunnar_HalloGesagt == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gunnar_Everywhere_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Everywhere_15_00"); //Kde se tu vzalo tolik žoldnéâù?
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_01"); //Vêtšina z nich je z trestanecké kolonie.
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_02"); //Další skupina žoldnéâù pochází odnêkud z jihu, kde nejspíš lovili skâety.
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_03"); //A vsadím se, že se tu teë taky objevilo nêkolik banditù z hor, aby se mohli zadarmo najíst!
};

// ************************************************************
// 			  			Aud dem Süden
// ************************************************************
INSTANCE DIA_Gunnar_South (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 3;
	condition   = DIA_Gunnar_South_Condition;
	information = DIA_Gunnar_South_Info;
	permanent   = TRUE;
	description = "Co víš o žoldnéâích z jihu?";
};
FUNC INT DIA_Gunnar_South_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gunnar_South_Info()
{
	AI_Output (other, self, "DIA_Gunnar_South_15_00"); //Co víš o žoldnéâích z jihu?
	AI_Output (self, other, "DIA_Gunnar_South_10_01"); //Nic moc. Co vím, tak tam lovili skâety.
	AI_Output (self, other, "DIA_Gunnar_South_10_02"); //Sylvio je jejich šéf. Bullco, Sentenza, Raoul a nêkolik dalších pro nêj pracuje.
};

// ************************************************************
// 			  			Aus der Barriere
// ************************************************************
INSTANCE DIA_Gunnar_Colony (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 4;
	condition   = DIA_Gunnar_Colony_Condition;
	information = DIA_Gunnar_Colony_Info;
	permanent   = TRUE;
	description = "Který z nich sem pâišel z kolonie?";
};
FUNC INT DIA_Gunnar_Colony_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gunnar_Colony_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Colony_15_00"); //Kdo všechno pâišel z kolonie?
	AI_Output (self, other, "DIA_Gunnar_Colony_10_01"); //Lee a jeho lidé. Torlof, Cord, Jarvis, Vlk a buhvíkdo ještê.
};

// ************************************************************
// 			  				Banditen
// ************************************************************
INSTANCE DIA_Gunnar_Bandits (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 5;
	condition   = DIA_Gunnar_Bandits_Condition;
	information = DIA_Gunnar_Bandits_Info;
	permanent   = TRUE;
	description = "Co ti banditi, co jsi o nich mluvil?";
};
FUNC INT DIA_Gunnar_Bandits_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gunnar_Bandits_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Bandits_15_00"); //Co ti banditi, co jsi o nich mluvil?
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_01"); //Ale, jen jsem žvanil. Nejsem si tím vùbec jistý.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_02"); //Na jihu údolí jsou hory s opuštênými doly. Ukrývá se tam nêkolik banditù.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_03"); //Jsou tam taky trestanci z kolonie, stejní jako tihle žoldáci na našem statku.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_04"); //Jedinej rozdíl mezi nima je, že jsou ještê horší bahno. Zabijou každýho, kdo se k nim pâiblíží.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gunnar_PICKPOCKET (C_INFO)
{
	npc			= BAU_902_Gunnar;
	nr			= 900;
	condition	= DIA_Gunnar_PICKPOCKET_Condition;
	information	= DIA_Gunnar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Gunnar_PICKPOCKET_Condition()
{
	C_Beklauen (45, 70);
};
 
FUNC VOID DIA_Gunnar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gunnar_PICKPOCKET);
	Info_AddChoice		(DIA_Gunnar_PICKPOCKET, DIALOG_BACK 		,DIA_Gunnar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gunnar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gunnar_PICKPOCKET_DoIt);
};

func void DIA_Gunnar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gunnar_PICKPOCKET);
};
	
func void DIA_Gunnar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gunnar_PICKPOCKET);
};


