///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Nauč mě tomu jazyku.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Začneme od nejjednoduššího. Nejdřív tě tedy naučím jazyku rolníků.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //Základním pravidlem písemných záznamů rolníků je, že se zabývají světskými záležitostmi, jako je práce, láska nebo získávání potravy.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //Býval to běžný jazyk ve městech. Pokud jej znáš, dokážeš pochopit většinu zdejších textů.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Jazykem rolníků už vládneš, ale jazyk válečníků je o něco obtížnější.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Texty v tomto jazyce se většinou týkají zbraní a válčení. I ty by ses z jejich záznamů mohl lecčemus přiučit.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //Vytříbený jazyk kněží je skutečně obtížné pochopit, ale rád ti s tím pomohu.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //Je to jazyk posvátných textů, které pojednávají o historii a o magii stvořitelů.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Každý z těchto textů je skutečným pokladem, když víš, co znamená.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //Víc už tě naučit nemohu. Jazyk stavitelů jsi už plně zvládl.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Běž si vyzkoušet své nové znalosti. Uvidíš, že jazyk stavitelů už ti nebude tak nepochopitelnou záhadou.
};



