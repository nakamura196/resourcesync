<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:s="http://www.sitemaps.org/schemas/sitemap/0.9"
  xmlns:rs="http://www.openarchives.org/rs/terms/">

  <xsl:output method="html" encoding="UTF-8"/>

  <xsl:template match="s:urlset">
    <html>
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"/>
      </head>
      <body>
        <nav class="bg-white border-gray-200 px-2 sm:px-4 py-2.5 rounded dark:bg-gray-900">
          <div class="container flex flex-wrap items-center justify-between mx-auto">
            <a href="./capabilitylist.xml" class="flex items-center">
              <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">ResourceSync</span>
            </a>
            <div class="hidden w-full md:block md:w-auto" id="navbar-default">
              <ul class="flex flex-col p-4 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
                <li>
                  <a href="./capabilitylist.xml" class="block py-2 pl-3 pr-4 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white" aria-current="page">capabilitylist</a>
                </li>
                <li>
                  <a href="./resourcelist-index.xml" class="block py-2 pl-3 pr-4 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white">resourcelist-index</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="container mx-auto my-4">
          <h1 class="text-4xl font-bold text-center mb-4">
            <xsl:value-of select="rs:md/@capability"/>
          </h1>
          <table class="table-auto">
            <thead>
              <tr>
                <th class="px-4 py-2">loc</th>
                <th class="px-4 py-2">lastmod</th>
                <th class="px-4 py-2">capability</th>
              </tr>
            </thead>
            <tbody>
              <xsl:apply-templates select="s:url"/>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="s:url">
    <tr>
      <td class="border px-4 py-2">
        <a class="font-medium text-blue-600 dark:text-blue-500 hover:underline" href="{normalize-space(s:loc)}">
          <xsl:value-of select="s:loc"/>
        </a>
      </td>
      <td class="border px-4 py-2">
        <xsl:value-of select="s:lastmod"/>
      </td>
      <td class="border px-4 py-2">
        <xsl:value-of select="rs:md/@capability"/>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>

